#-*- coding: UTF-8 -*-

from flask import g

class User:

# CHECK
	
	# check user exist by id
	@staticmethod
	def check_exist_by_id(user_id):
		query = "SELECT * FROM user WHERE UserID = %d" % user_id
		g.cursor.execute(query)
		return g.cursor.rowcount > 0