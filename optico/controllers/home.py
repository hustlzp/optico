#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json
from optico import app
from optico.models.type_model import Type
from optico.models.carousel_model import Carousel
from optico.utils import convert_dict

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def home():
	mtypes = convert_dict(Type.get_mtypes())
	for mt in mtypes:
		mt['stypes'] = convert_dict(Type.get_stypes(mt['MainTypeID']))
	return render_template('home.html', mtypes=mtypes)

# page service
#--------------------------------------------------

# view (public)
@app.route('/service')
def service():
	return render_template('service.html')

# page about
#--------------------------------------------------

# view (public)
@app.route('/about')
def about():
	return render_template('about.html')

# page contact
#--------------------------------------------------

# view (public)
@app.route('/contact')
def contact():
	return render_template('contact.html')