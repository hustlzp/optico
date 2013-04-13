#-*- coding: UTF-8 -*-

from flask import session, abort

import config


# Check if is Administrator
def check_admin():
	if not ('user_id' in session and session['user_id'] == config.ADMIN_ID):
		abort(404)

# Check if login
def check_login():
	if 'user_id' not in session:
		abort(404)

# Check if login and owner
def check_private(user_id):
	if not ('user_id' in session and session['user_id'] == user_id):
		abort(404)