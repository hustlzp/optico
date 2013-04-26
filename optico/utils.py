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
def build_pimg_filename(filename):
	return "p-" + str(uuid1()) + "." + filename.split('.')[-1]

# Build an unique image file name for mtype
def build_mimg_filename(filename):
	return "m-" + str(uuid1()) + "." + filename.split('.')[-1]

# Build an unique image file name for carousel
def build_cimg_filename(filename):
	return "c-" + str(uuid1()) + "." + filename.split('.')[-1]
