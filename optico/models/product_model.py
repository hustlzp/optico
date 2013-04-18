#-*- coding: UTF-8 -*-

from flask import g

from optico.db import product

class Product:
	@staticmethod
	def add(type_id, name, image_url, description, details, src_url):
		result = g.conn.execute(product.insert(), SubTypeID=type_id, Name=name, ImageUrl=image_url, Description=description, Details=details, SrcUrl=src_url)
		return result.inserted_primary_key