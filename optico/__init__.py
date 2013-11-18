#-*- coding: UTF-8 -*-
import sys
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.uploads import UploadSet, IMAGES, configure_uploads

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
    PERMANENT_SESSION_LIFETIME=config.PERMANENT_SESSION_LIFETIME,
    DEBUG=config.DEBUG,
    UPLOADED_IMAGES_DEST=config.UPLOADED_IMAGES_DEST,
    UPLOADED_IMAGES_URL=config.UPLOADED_IMAGES_URL)

# SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://%s:%s@%s/%s' % (
    config.DB_USER, config.DB_PASSWORD, config.DB_HOST, config.DB_NAME)
db = SQLAlchemy(app)

# Upload sets
images = UploadSet('images', IMAGES)
configure_uploads(app, images)

# send log msg using smtp
if not app.debug:
    import logging
    from logging.handlers import SMTPHandler

    credentials = (config.SMTP_USER, config.SMTP_PASSWORD)
    mail_handler = SMTPHandler((config.SMTP_SERVER, config.SMTP_PORT), config.SMTP_USER, config.EMAIL_TECH,
                               'optico-log', credentials)
    mail_handler.setLevel(logging.ERROR)
    app.logger.addHandler(mail_handler)

import models
import controllers
from models import Carousel
from models import Mtype

# inject vars into template context
@app.context_processor
def inject_vars():
    return dict(
        admin_id=config.ADMIN_ID,
        # 为了避免与其他页面的变量冲突，加上global前缀
        global_mtypes=Mtype.query.order_by(Mtype.show_order).all(),
        global_carousels=Carousel.query.all())