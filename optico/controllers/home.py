#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json

from optico import app

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def home():
	return render_template('home.html')

# page about
#--------------------------------------------------

# view (public)
@app.route('/about')
def about():
	return render_template('about.html')