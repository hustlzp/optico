#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json
from optico import app
import config
from optico.models.carousel_model import Carousel
from optico.utils import convert_dict, check_admin, build_cimg_filename

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
		# save image
		image = request.files['image']
		image_filename = build_cimg_filename(image.filename)
		image.save(config.IMAGE_PATH + image_filename)

		# add carousel
		image_url = config.IMAGE_URL + image_filename
		link = request.form['link']
		Carousel.add(image_url, link)

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
		image_url = Carousel.get_by_id(c_id)['ImageUrl']
		if image.filename:
			# get the original image file name
			image_filename = image_url.split('/')[-1]
			image.save(config.IMAGE_PATH + image_filename)
			image_url = config.IMAGE_URL + image_filename

		# Edit carousel
		link = request.form['link']
		Carousel.edit(c_id, image_url, link)

		return redirect(url_for('manage_carousel'))

# Page delete carousel
#--------------------------------------------------

# View (admin)
@app.route('/delete_carousel/<int:c_id>')
def delete_carousel(c_id):
	check_admin()
	Carousel.delete(c_id)
	return redirect(url_for('manage_carousel'))