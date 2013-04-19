#-*- coding: UTF-8 -*-

from flask import g

from sqlalchemy.sql import select

from optico.db import product

class Product:

# GET
	
	# get product by id
	@staticmethod
	def get_by_id(product_id):
		s = select([product]).where(product.c.ProductID == product_id)
		return g.conn.execute(s).fetchone()

# NEW

	# add product
	@staticmethod
	def add(mtype_id, stype_id, name, image_url, description, details, src_url):
		result = g.conn.execute(
			product.insert()
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url))
		return result.inserted_primary_key

# UPDATE

	# edit product
	@staticmethod
	def edit(product_id, mtype_id, stype_id, name, image_url, description, details, src_url):
		return g.conn.execute(
			product.update()
			.where(product.c.ProductID == product_id)
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url))