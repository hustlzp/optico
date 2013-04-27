#-*- coding: UTF-8 -*-

from uuid import uuid1
from flask import session, abort
import config

# Check if is Administrator
def check_admin():
	if not ('user_id' in session and session['user_id'] == config.ADMIN_ID):
		abort(404)

# Convert RowProxy to Dict
def convert_dict(row_proxy_list):
	return [dict(r) for r in row_proxy_list]

# Build an unique image file name for product
def build_pimg_filename(p_id, filename):
	return "p" + str(p_id) + "." + filename.split('.')[-1]

# Build an unique image file name for mtype
def build_mimg_filename(mtype_id, filename):
	return "m" + str(mtype_id) + "." + filename.split('.')[-1]

# Build an unique image file name for carousel
def build_cimg_filename(c_id, filename):
	return "c" + str(c_id) + "." + filename.split('.')[-1]
