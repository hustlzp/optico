#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json

from xichuangzhu import app

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def index():
	return render_template('index.html')

# page about
#--------------------------------------------------

# view (public)
@app.route('/about')
def about():
	return render_template('about.html')