#-*- coding: UTF-8 -*-

from flask import session, abort

import config

# Check if is Administrator
def check_admin():
	if not ('user_id' in session and session['user_id'] == config.ADMIN_ID):
		abort(404)
