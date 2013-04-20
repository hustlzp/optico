#-*- coding: UTF-8 -*-

from flask import session, abort

import config

# Check if is Administrator
def check_admin():
	# if not ('user_id' in session and session['user_id'] == config.ADMIN_ID):
	# 	abort(404)
	pass

# Convert RowProxy to Dict
def convert_dict(row_proxy_list):
	return [dict(r) for r in row_proxy_list]
