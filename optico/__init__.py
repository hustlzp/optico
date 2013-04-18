#-*- coding: UTF-8 -*-

import sys

from flask import Flask, g, session

import MySQLdb
import MySQLdb.cursors

sys.path.append('/var/www/flaskconfig/optico')
import config

# convert python's encoding to utf8
reload(sys)
sys.setdefaultencoding('utf8')

# app
app = Flask(__name__)
app.config.update(
	SECRET_KEY=config.SECRET_KEY,
	SESSION_COOKIE_NAME=config.SESSION_COOKIE_NAME,
	PERMANENT_SESSION_LIFETIME=config.PERMANENT_SESSION_LIFETIME)

# inject vars into template context
@app.context_processor
def inject_vars():
	return dict()

# send log msg using smtp
if not app.debug:
	import logging
	from logging.handlers import SMTPHandler
	credentials = (config.SMTP_USER, config.SMTP_PASSWORD)
	mail_handler = SMTPHandler((config.SMTP_SERVER, config.SMTP_PORT), config.SMTP_FROM, config.SMTP_ADMIN, 'xcz-log', credentials)
	mail_handler.setLevel(logging.ERROR)
	app.logger.addHandler(mail_handler)

# mysql
@app.before_request
def before_request():
	g.conn = MySQLdb.connect(host=config.DB_HOST, user=config.DB_USER, passwd=config.DB_PASSWD, db=config.DB_NAME, use_unicode=True, charset='utf8', cursorclass=MySQLdb.cursors.DictCursor)
	g.cursor = g.conn.cursor()

@app.teardown_request
def teardown_request(exception):
	g.conn.close()

import controllers