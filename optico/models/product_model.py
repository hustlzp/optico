#-*- coding: UTF-8 -*-

from flask import g
from sqlalchemy.sql import select
from optico.db import product
from optico.db import para
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

	# get all paramters of a product
	@staticmethod
	def get_paras_by_product(product_id):
		return convert_dict(g.conn.execute(
			select([para])
			.where(para.c.ProductID == product_id)).fetchall())

	# get paramter by id
	@staticmethod
	def get_para_by_id(para_id):
		return g.conn.execute(
			select([para])
			.where(para.c.ParamterID == para_id)).fetchone()

# NEW

	# add product
	@staticmethod
	def add(mtype_id, stype_id, name, description, details, src_url):
		result = g.conn.execute(
			product.insert()
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, Description=description, Details=details, SrcUrl=src_url))
		return result.inserted_primary_key[0]

	# add paramter to a product
	@staticmethod
	def add_para(product_id, title, content):
		return g.conn.execute(
			para.insert()
			.values(ProductID=product_id, Title=title, Content=content))

# UPDATE

	# edit product
	@staticmethod
	def edit(product_id, mtype_id, stype_id, name, image_url, description, details, src_url):
		return g.conn.execute(
			product.update()
			.where(product.c.ProductID == product_id)
			.values(MainTypeID=mtype_id, SubTypeID=stype_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url))

	# Update image url
	@staticmethod
	def update_product_img_url(p_id, img_url):
		return g.conn.execute(
			product.update()
			.where(product.c.ProductID == p_id)
			.values(ImageUrl=img_url))

	# edit para
	@staticmethod
	def edit_para(para_id, title, content):
		return g.conn.execute(
			para.update()
			.where(para.c.ParamterID == para_id)
			.values(Title=title, Content=content))

# DELETE

	# delete product
	@staticmethod
	def delete(product_id):
		return g.conn.execute(
			product.delete()
			.where(product.c.ProductID == product_id))

	# delete paramter
	@staticmethod
	def delete_para(para_id):
		return g.conn.execute(
			para.delete()
			.where(para.c.ParamterID == para_id))