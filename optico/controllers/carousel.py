#-*- coding: UTF-8 -*-
import os
from flask import render_template, request, redirect, url_for, json
from optico import app
import config
from optico.models import Carousel
from optico.utils import check_admin, build_cimg_filename

# Page manage carousel
#--------------------------------------------------

# View (admin)
@app.route('/manage_carousel', methods=['GET', 'POST'])
def manage_carousel():
    check_admin()
    if request.method == 'GET':
        carousels = Carousel.get_all()
        return render_template('manage_carousel.html', carousels=carousels)
    else:
        # add carousel
        link = request.form['link']
        title = request.form['title']
        content = request.form['content']
        new_id = Carousel.add(link, title, content)

        # save image
        image = request.files['image']
        image_filename = build_cimg_filename(new_id, image.filename)
        image.save(config.IMAGE_PATH + image_filename)

        # update carousel image url
        image_url = config.IMAGE_URL + image_filename
        Carousel.update_img_url(new_id, image_url)
        return redirect(url_for('manage_carousel'))

# Page edit carousel
#--------------------------------------------------

# View (admin)
@app.route('/edit_carousel/<int:c_id>', methods=['GET', 'POST'])
def edit_carousel(c_id):
    check_admin()
    if request.method == 'GET':
        carousel = Carousel.get_by_id(c_id)
        return render_template('edit_carousel.html', carousel=carousel)
    else:
        # save image
        image = request.files['image']
        if image.filename:
            # get the original image file name
            image_filename = build_cimg_filename(c_id, image.filename)
            image.save(config.IMAGE_PATH + image_filename)
            image_url = config.IMAGE_URL + image_filename
        else:
            image_url = Carousel.get_by_id(c_id)['ImageUrl']

        # Edit carousel
        link = request.form['link']
        title = request.form['title']
        content = request.form['content']
        Carousel.edit(c_id, image_url, link, title, content)

        return redirect(url_for('manage_carousel'))

# Page delete carousel
#--------------------------------------------------

# View (admin)
@app.route('/delete_carousel/<int:c_id>')
def delete_carousel(c_id):
    check_admin()

    # Try to delete img file
    image_filename = Carousel.get_by_id(c_id)['ImageUrl'].split('/')[-1]
    image_path = config.IMAGE_PATH + image_filename
    if os.path.isfile(image_path):
        os.remove(image_path)

    Carousel.delete(c_id)
    return redirect(url_for('manage_carousel'))