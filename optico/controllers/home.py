#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json

from optico import app

from optico.models.type_model import Type

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def home():
	mtypes = Type.get_mtypes()
	for mt in mtypes:
		mt['stypes'] = Type.get_stypes(mt['MainTypeID'])
	return render_template('home.html', mtypes=mtypes)

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