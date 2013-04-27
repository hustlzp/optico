#-*- coding: UTF-8 -*-

from flask import g
from sqlalchemy.sql import select
from optico.db import carousel
from optico.utils import convert_dict

class Carousel:

# GET

	# get all carousels
	@staticmethod
	def get_all():
		return g.conn.execute(
			select([carousel])).fetchall()

	# get carousel by id
	@staticmethod
	def get_by_id(c_id):
		return g.conn.execute(
			select([carousel])
			.where(carousel.c.CarouselID==c_id)).fetchone()

# NEW

	# add carousel
	@staticmethod
	def add(link_url):
		return g.conn.execute(
			carousel.insert()
			.values(LinkUrl=link_url)).inserted_primary_key[0]

# UPDATE

	# edit carousel
	@staticmethod
	def edit(c_id, image_url, link_url):
		return g.conn.execute(
			carousel.update()
			.where(carousel.c.CarouselID==c_id)
			.values(ImageUrl=image_url, LinkUrl=link_url))

	# 
	@staticmethod
	def update_img_url(c_id, image_url):
		return g.conn.execute(
			carousel.update()
			.where(carousel.c.CarouselID==c_id)
			.values(ImageUrl=image_url))

# DELETE

	# delete carousel
	@staticmethod
	def delete(c_id):
		return g.conn.execute(
			carousel.delete()
			.where(carousel.c.CarouselID==c_id))
