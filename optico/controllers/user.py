#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json, session

from optico import app

import config

from optico.utils import check_admin

# proc - login
#--------------------------------------------------

@app.route('/login', methods=['GET', 'POST'])
def login():
	if request.method == 'GET':
		return render_template('login.html')
	elif request.method == 'POST':
		user = request.form['user']
		pwd = request.form['pwd']
		if user == config.ADMIN and pwd == config.PWD:
			# set session
			session.permanent = True
			session['user_id'] = config.ADMIN_ID
			return redirect(url_for('home'))
		else:
			return redirect(url_for('login'))

# proc - logout
#--------------------------------------------------
@app.route('/logout')
def logout():	
	session.pop('user_id', None)
	session.pop('user_name', None)
	session.pop('user_abbr', None)
	return redirect(url_for('index'))