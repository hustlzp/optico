#-*- coding: UTF-8 -*-
from flask import render_template, request, redirect, url_for
from optico import app, db, images
import config
from optico.models import Carousel
from optico.utils import check_admin


@app.route('/carousel/manage', methods=['GET', 'POST'])
def manage_carousel():
    """Page - manage carousel"""
    check_admin()
    if request.method == 'GET':
        max_id = db.session.query(db.func.max(Carousel.id).label('max_id')).one().max_id
        carousels = Carousel.query.all()
        return render_template('carousel/manage.html', carousels=carousels, max_id=max_id)
    else:
        # Save image
        max_id = db.session.query(db.func.max(Carousel.id).label('max_id')).one().max_id
        filename = images.save(request.files['image'], name='c%s.' % str(max_id + 1))

        # add carousel
        carousel = Carousel(title=request.form['title'], content=request.form['title'], link_url=request.form['title'],
                            image=filename)
        db.session.add(carousel)
        db.session.commit()
        return redirect(url_for('manage_carousel'))


@app.route('/carousel/<int:c_id>/edit', methods=['GET', 'POST'])
def edit_carousel(c_id):
    """Page - edit carousel"""
    check_admin()
    carousel = Carousel.query.get_or_404(c_id)
    if request.method == 'GET':
        return render_template('carousel/edit.html', carousel=carousel)
    else:
        # Delete old images
        # TODO - because upload sets has no delele method

        # Save new image if uploaded
        image = request.files['image']
        if image.filename:
            filename = images.save(image, name='c%s.' % str(carousel.id))
            carousel.image = filename

        # update carousel info
        carousel.link_url = request.form['link_url']
        carousel.title = request.form['title']
        carousel.content = request.form['content']
        db.session.add(carousel)
        db.session.commit()
        return redirect(url_for('manage_carousel'))


@app.route('/carousel/<int:c_id>/delete')
def delete_carousel(c_id):
    """Proc - delete carousel"""
    check_admin()

    # Try to delete image file
    # TODO

    carousel = Carousel.query.get_or_404(c_id)
    db.session.delete(carousel)
    db.session.commit()
    return redirect(url_for('manage_carousel'))