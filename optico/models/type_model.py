#-*- coding: UTF-8 -*-

from flask import g

from optico.utils import convert_dict

from sqlalchemy.sql import select

from optico.db import mtype
from optico.db import stype

class Type:

# GET

	# get all main types
	@staticmethod
	def get_mtypes():
		return convert_dict(g.conn.execute(
			select([mtype])).fetchall())

	# get main type by id
	@staticmethod
	def get_mtype_by_id(mtype_id):
		return g.conn.execute(
			select([mtype])
			.where(mtype.c.MainTypeID == mtype_id)).fetchone()

	# get all sub types
	@staticmethod
	def get_stypes(mtype_id):
		return g.conn.execute(
			select([stype])
			.where(stype.c.MainTypeID == mtype_id)).fetchall()

	# get sub type by id
	@staticmethod
	def get_stype_by_id(stype_id):
		return g.conn.execute(
			select([stype])
			.where(stype.c.SubTypeID == stype_id)).fetchone()
	
# NEW

	# add main type
	@staticmethod
	def add_mtype(name, img_url):
		return g.conn.execute(
			mtype.insert()
			.values(Name=name, ImageUrl=img_url))

# UPDETE

	# edit main type
	@staticmethod
	def edit_mtype(mtype_id, name, img_url):
		return g.conn.execute(
			mtype.update()
			.where(mtype.c.MainTypeID == mtype_id)
			.values(Name=name, ImageUrl=img_url))
