#-*- coding: UTF-8 -*-

from flask import g

class User:

# GET

	# get people by id
	@staticmethod
	def get_user_by_id(user_id):
		query = "SELECT * FROM user WHERE UserID = %d" % user_id
		g.cursor.execute(query)
		return g.cursor.fetchone()

	# get people by abbr
	@staticmethod
	def get_user_by_abbr(user_abbr):
		query = "SELECT * FROM user WHERE Abbr = '%s'" % user_abbr
		g.cursor.execute(query)
		return g.cursor.fetchone()

	# get id by name
	@staticmethod
	def get_id_by_name(user_name):
		query = "SELECT UserID FROM user WHERE Name = '%s'" % user_name
		g.cursor.execute(query)
		return g.cursor.fetchone()['UserID']	

	# get name by id
	@staticmethod
	def get_name_by_id(user_id):
		query = "SELECT Name FROM user WHERE UserID = %d" % user_id
		g.cursor.execute(query)
		return g.cursor.fetchone()['Name']

	# get abbr by id
	@staticmethod
	def get_abbr_by_id(user_id):
		query = "SELECT Abbr FROM user WHERE UserID = %d" % user_id
		g.cursor.execute(query)
		return g.cursor.fetchone()['Abbr']

	# get id by abbr
	@staticmethod
	def get_id_by_abbr(user_abbr):
		query = "SELECT UserID FROM user WHERE Abbr = '%s'" % user_abbr
		g.cursor.execute(query)
		return g.cursor.fetchone()['UserID']

# UPDATE

	# active user
	@staticmethod
	def active_user(userID):
		query = "UPDATE user SET IsActive = 1 WHERE UserID = %d" % userID
		g.cursor.execute(query)
		return g.conn.commit()

	# add email to the user
	@staticmethod
	def add_email(user_id, email):
		query = "UPDATE user SET Email = '%s' WHERE UserID = %d" % (email, user_id)
		g.cursor.execute(query)
		return g.conn.commit()

# NEW

	# add a new user
	@staticmethod
	def add_user(userID, name, abbr, avatar, signature, desc, locationID, location):
		query = '''INSERT INTO user (UserID, Name, Abbr, Avatar, Signature, Description, LocationID, Location, CheckInformTime)\n
			VALUES (%d, '%s', '%s', '%s', '%s', '%s', %d, '%s', NOW())''' % (userID, name, abbr, avatar, signature, desc, locationID, location)
		g.cursor.execute(query)
		return g.conn.commit()

# CHECK
	
	# check user exist by id
	@staticmethod
	def check_exist_by_id(user_id):
		query = "SELECT * FROM user WHERE UserID = %d" % user_id
		g.cursor.execute(query)
		return g.cursor.rowcount > 0

	# check user exist by name
	@staticmethod
	def check_exist_by_name(user_name):
		query = "SELECT * FROM user WHERE Name = '%s'" % user_name
		g.cursor.execute(query)
		return g.cursor.rowcount > 0

	# check user active
	@staticmethod
	def check_active(user_id):
		query = "SELECT * FROM user WHERE UserID = %d AND IsActive = 1" % user_id
		g.cursor.execute(query)
		return g.cursor.rowcount > 0


