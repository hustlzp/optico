#-*- coding: UTF-8 -*-

from flask import g
from optico import app
from sqlalchemy import create_engine, MetaData, Table
import config

engine = create_engine(
    'mysql+mysqldb://%s:%s@%s/%s?charset=utf8' % (config.DB_USER, config.DB_PWD, config.DB_HOST, config.DB_NAME))

# Open conn before request
@app.before_request
def before_request():
    g.conn = engine.connect()

# Close conn after request
@app.teardown_request
def teardown_request(exception):
    g.conn.close()

# table definition
metadata = MetaData(bind=engine)
product = Table('product', metadata, autoload=True)
mtype = Table('maintype', metadata, autoload=True)
stype = Table('subtype', metadata, autoload=True)
para = Table('product_paramter', metadata, autoload=True)
carousel = Table('carousel', metadata, autoload=True)