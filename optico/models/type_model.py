#-*- coding: UTF-8 -*-

from flask import g
from sqlalchemy.sql import select
from optico.db import mtype
from optico.db import stype
from optico.utils import convert_dict

class Type:

# GET

	# Get mtypes order by ShowOrder
	@staticmethod
	def get_mtypes():
		return convert_dict(g.conn.execute(
			select([mtype]).
			order_by(mtype.c.ShowOrder.asc())).fetchall())

	# get main type by id
	@staticmethod
	def get_mtype_by_id(mtype_id):
		return g.conn.execute(
			select([mtype])
			.where(mtype.c.MainTypeID == mtype_id)).fetchone()

	# get all sub types
	@staticmethod
	def get_stypes(mtype_id):
		return convert_dict(g.conn.execute(
			select([stype])
			.where(stype.c.MainTypeID == mtype_id)).fetchall())

	# get sub type by id
	@staticmethod
	def get_stype_by_id(stype_id):
		return g.conn.execute(
			select([stype])
			.where(stype.c.SubTypeID == stype_id)).fetchone()
	
# NEW

	# add main type
	@staticmethod
	def add_mtype(name, order):
		return g.conn.execute(
			mtype.insert()
			.values(Name=name, ShowOrder=order)).inserted_primary_key[0]


	# add sub type
	@staticmethod
	def add_stype(mtype_id, name):
		return g.conn.execute(
			stype.insert()
			.values(MainTypeID=mtype_id, Name=name)).inserted_primary_key[0]

# UPDATE

	# update main type
	@staticmethod
	def edit_mtype(mtype_id, name, image_url, order):
		return g.conn.execute(
			mtype.update()
			.where(mtype.c.MainTypeID == mtype_id)
			.values(Name=name, ImageUrl=image_url, ShowOrder=order))

	# update main type img url
	@staticmethod
	def update_mtype_img_url(m_id, image_url):
		return g.conn.execute(
			mtype.update()
			.where(mtype.c.MainTypeID == m_id)
			.values(ImageUrl=image_url))

	# edit sub type
	@staticmethod
	def edit_stype(stype_id, mtype_id, name):
		return g.conn.execute(
			stype.update()
			.where(stype.c.SubTypeID == stype_id)
			.values(MainTypeID=mtype_id, Name=name))

# DELETE

	# delete main type
	@staticmethod
	def delete_mtype(mtype_id):
		return g.conn.execute(
			mtype.delete()
			.where(mtype.c.MainTypeID == mtype_id))

	# delete sub type
	@staticmethod
	def delete_stype(stype_id):
		return g.conn.execute(
			stype.delete()
			.where(stype.c.SubTypeID == stype_id))