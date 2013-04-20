#-*- coding: UTF-8 -*-

from flask import g

from sqlalchemy.sql import select

from optico.db import product

from optico.utils import convert_dict

class Product:

# GET
	
	# get product by id
	@staticmethod
	def get_by_id(product_id):
		return g.conn.execute(
			select([product])
			.where(product.c.ProductID == product_id)).fetchone()

	# get products by main type
	@staticmethod
	def get_by_mtype(mtype_id):
		return g.conn.execute(
			select([product])
			.where(product.c.MainTypeID == mtype_id)).fetchall()

	# get products by sub type
	@staticmethod
	def get_by_stype(stype_id):
		return g.conn.execute(
			select([product])
			.where(product.c.SubTypeID == stype_id)).fetchall()

	# get all products
	@staticmethod
	def get_all():
		return g.conn.execute(
			select([product])).fetchall()

# NEW

	# add product
	@staticmethod
	def add(mtype_id, stype_id, name, image_url, description, details, src_url):
		result = g.conn.execute(
			product.insert()
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url))
		return result.inserted_primary_key[0]

# UPDATE

	# edit product
	@staticmethod
	def edit(product_id, mtype_id, stype_id, name, image_url, description, details, src_url):
		return g.conn.execute(
			product.update()
			.where(product.c.ProductID == product_id)
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url))