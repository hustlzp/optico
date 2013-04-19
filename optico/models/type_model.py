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
		s = select([mtype])
		return convert_dict(g.conn.execute(s).fetchall())

	# get all sub types
	@staticmethod
	def get_stypes(main_type_id):
		s = select([stype]).where(stype.c.MainTypeID == main_type_id)
		return convert_dict(g.conn.execute(s).fetchall())
	