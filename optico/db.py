#-*- coding: UTF-8 -*-

from flask import g

from optico import app

from sqlalchemy import create_engine, MetaData, Table

engine = create_engine('mysql+mysqldb://root:xiaowangzi@localhost/optico?charset=utf8')

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