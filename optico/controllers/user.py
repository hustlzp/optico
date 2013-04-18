#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json, session

from optico import app

import config

from optico.models.user_model import User

from optico.utils import check_admin

# proc - login
#--------------------------------------------------

@app.route('/login')
def auth():
	if User.check_exist_by_id(user_id):
		# set session
		session.permanent = True
		session['user_id'] = user_id
	return redirect(url_for('index'))

# proc - logout
#--------------------------------------------------
@app.route('/logout')
def logout():	
	session.pop('user_id', None)
	session.pop('user_name', None)
	session.pop('user_abbr', None)
	return redirect(url_for('index'))