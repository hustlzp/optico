#-*- coding: UTF-8 -*-

from __future__ import division

import urllib, urllib2

import smtplib
from email.mime.text import MIMEText

import hashlib

import math

from flask import render_template, request, redirect, url_for, json, session

from xichuangzhu import app

import config

from xichuangzhu.models.user_model import User

from xichuangzhu.utils import content_clean, time_diff, check_login

# proc - login by douban's oauth2.0 (public)
#--------------------------------------------------

@app.route('/login/douban')
def auth():
	code = request.args['code']

	# get access token and userID
	url = "https://www.douban.com/service/auth2/token"
	data = {
		'client_id': config.DOUBAN_CLIENT_ID,
		'client_secret': config.DOUBAN_SECRET,
		'redirect_uri': config.DOUBAN_REDIRECT_URI,
		'grant_type': 'authorization_code',
		'code': code
	}
	data = urllib.urlencode(data)
	req = urllib2.Request(url, data)
	response = urllib2.urlopen(req)
	info = eval(response.read())
	user_id = int(info['douban_user_id'])

	# if user exist
	if User.check_exist_by_id(user_id):
		# if user unactive
		if not User.check_active(user_id):
			return redirect(url_for('verify_email_callback', state='unactive', user_id=user_id))
		else:
			# set session
			session.permanent = True
			session['user_id'] = user_id
			session['user_name'] = User.get_name_by_id(user_id)
			session['user_abbr'] = User.get_abbr_by_id(user_id)
			return redirect(url_for('index'))
	# if not exist
	else:
		# get user info
		url = "https://api.douban.com/v2/user/" + str(user_id)
		req = urllib2.Request(url)
		response = urllib2.urlopen(req)
		user_info = eval(response.read().replace('\\', ''))	# remove '\' and convert str to dict

		# add user
		user_id = int(user_info['id'])
		user_name = user_info['name']
		abbr = user_info['uid']
		avatar = user_info['avatar']
		signature = user_info['signature']
		desc = user_info['desc']
		location_id = int(user_info['loc_id']) if 'loc_id' in user_info else 0
		location = user_info['loc_name']
		User.add_user(user_id, user_name, abbr, avatar, signature, desc, location_id, location)

		# go to the verify email page
		return redirect(url_for('send_verify_email', user_id=user_id))

# page - send verify email
#--------------------------------------------------

# view (login)
@app.route('/send_verify_email/douban', methods=['GET', 'POST'])
def send_verify_email():
	check_login()

	if request.method == 'GET':
		user_id = int(request.args['user_id'])
		user_name = User.get_name_by_id(user_id)
		return render_template('send_verify_email.html', user_id=user_id, user_name=user_name)
	elif request.method == 'POST':
		# email
		t_addr = request.form['email']

		# user info
		user_id = int(request.form['user_id'])
		user_name = User.get_name_by_id(user_id)

		# add this email to user
		User.add_email(user_id, t_addr)

		# gene verify url
		verify_code = hashlib.sha1(user_name).hexdigest()
		verify_url = config.SITE_DOMAIN + "verify_email/douban/" + str(user_id) + "/" + verify_code

		# prepare email content
		msgText = '''<html>
			<h1>点击下面的链接，激活你在西窗烛的帐号：</h1>
			<a href='%s'>%s</a>
			</html>''' % (verify_url, verify_url)
		msg = MIMEText(msgText, 'html', 'utf-8')
		msg['From'] = "西窗烛 <" + config.SMTP_FROM + ">"
		msg['To'] = user_name + "<" + t_addr + ">"
		msg['Subject'] = "欢迎来到西窗烛！"

		# send email
		s = smtplib.SMTP(config.SMTP_SERVER, config.SMTP_PORT)
		s.login(config.SMTP_USER, config.SMTP_PASSWORD)
		s.sendmail(config.SMTP_FROM, t_addr, msg.as_string())

		return redirect(url_for('verify_email_callback', state='send_succ'))

# proc - verify the code and active user (public)
#--------------------------------------------------

@app.route('/verify_email/douban/<int:user_id>/<verify_code>')
def verify_email(user_id, verify_code):
	user_name = User.get_name_by_id(user_id)
	user_abbr = User.get_abbr_by_id(user_id)
	if verify_code == hashlib.sha1(user_name).hexdigest():
		User.active_user(user_id)
		session.permanent = True
		session['user_id'] = user_id
		session['user_name'] = user_name
		session['user_abbr'] = user_abbr
		return redirect(url_for('verify_email_callback', state='active_succ'))
	else:
		return redirect(url_for('verify_email_callback', state='active_failed'))

# page - show the state of verify
#--------------------------------------------------

# view (public)
@app.route('/verify_email_callback/douban/')
def verify_email_callback():
	state = request.args['state']
	user_id = int(request.args['user_id']) if 'user_id' in request.args else 0
	return render_template('verify_email_callback.html', state=state, user_id=user_id)

# proc - logout (login)
#--------------------------------------------------
@app.route('/logout')
def logout():
	check_login()
	
	session.pop('user_id', None)
	session.pop('user_name', None)
	session.pop('user_abbr', None)
	return redirect(url_for('index'))

# page - personal page
#--------------------------------------------------

# view (public)
@app.route('/people/<user_abbr>')
def people(user_abbr):
	people = User.get_user_by_abbr(user_abbr)
	user_name = '我' if "user_id" in session and session['user_id'] == people['UserID'] else people['Name']

	works = Love_work.get_works_by_user(people['UserID'], 1, 3)
	for work in works:
		work['Content'] = content_clean(work['Content'])
	works_num = Love_work.get_works_num_by_user(people['UserID'])

	reviews = Review.get_reviews_by_user(people['UserID'], 1, 3)
	for r in reviews:
		r['Time'] = time_diff(r['Time'])
	reviews_num = Review.get_reviews_num_by_user(people['UserID'])

	topics = Topic.get_topics_by_user(people['UserID'], 1, 3)
	for t in topics:
		t['Time'] = time_diff(t['Time'])
	topics_num = Topic.get_topics_num_by_user(people['UserID'])

	return render_template('people.html', people=people, works=works, works_num=works_num, reviews=reviews, reviews_num=reviews_num, topics=topics, topics_num=topics_num, user_name=user_name)

# page - people love works page
#--------------------------------------------------

# view (public)
@app.route('/people/<user_abbr>/love_works')
def people_love_works(user_abbr):
	people = User.get_user_by_abbr(user_abbr)
	user_name = '我' if "user_id" in session and session['user_id'] == people['UserID'] else people['Name']

	# pagination
	num_per_page = 10
	page = int(request.args['page'] if 'page' in request.args else 1)

	works = Love_work.get_works_by_user(people['UserID'], page, num_per_page)
	for work in works:
		work['Content'] = content_clean(work['Content'])

	works_num = Love_work.get_works_num_by_user(people['UserID'])

	# page paras
	total_page = int(math.ceil(works_num / num_per_page))
	pre_page = (page - 1) if page > 1 else 1
	if total_page == 0:
		next_page = 1
	elif page < total_page:
		next_page = page + 1
	else:
		next_page = total_page

	return render_template('people_love_works.html', people=people, works=works, user_name=user_name, page=page, total_page=total_page, pre_page=pre_page, next_page=next_page)

# page - people reviews
#--------------------------------------------------

# view (public)
@app.route('/people/<user_abbr>/reviews')
def people_reviews(user_abbr):
	people = User.get_user_by_abbr(user_abbr)
	user_name = '我' if "user_id" in session and session['user_id'] == people['UserID'] else people['Name']

	# pagination
	num_per_page = 10
	page = int(request.args['page'] if 'page' in request.args else 1)

	reviews = Review.get_reviews_by_user(people['UserID'], page, num_per_page)
	for r in reviews:
		r['Time'] = time_diff(r['Time'])

	reviews_num = Review.get_reviews_num_by_user(people['UserID'])

	# page paras
	total_page = int(math.ceil(reviews_num / num_per_page))
	pre_page = (page - 1) if page > 1 else 1
	if total_page == 0:
		next_page = 1
	elif page < total_page:
		next_page = page + 1
	else:
		next_page = total_page

	return render_template('people_reviews.html', people=people, reviews=reviews, user_name=user_name, page=page, total_page=total_page, pre_page=pre_page, next_page=next_page)

# page - people topics
#--------------------------------------------------

# view (public)
@app.route('/people/<user_abbr>/topics')
def people_topics(user_abbr):
	people = User.get_user_by_abbr(user_abbr)
	user_name = '我' if "user_id" in session and session['user_id'] == people['UserID'] else people['Name']

	# pagination
	num_per_page = 10
	page = int(request.args['page'] if 'page' in request.args else 1)

	topics = Topic.get_topics_by_user(people['UserID'], page, num_per_page)
	for t in topics:
		t['Time'] = time_diff(t['Time'])

	topics_num = Topic.get_topics_num_by_user(people['UserID'])

	# page paras
	total_page = int(math.ceil(topics_num / num_per_page))
	pre_page = (page - 1) if page > 1 else 1
	if total_page == 0:
		next_page = 1
	elif page < total_page:
		next_page = page + 1
	else:
		next_page = total_page

	return render_template('people_topics.html', people=people, topics=topics, user_name=user_name, page=page, total_page=total_page, pre_page=pre_page, next_page=next_page)

# page - informs
#--------------------------------------------------

# view (login)
@app.route('/informs')
def informs():
	check_login()
	
	# pagination
	num_per_page = 10
	page = int(request.args['page'] if 'page' in request.args else 1)
	
	informs = Inform.get_informs(session['user_id'], page, num_per_page)
	for i in informs:
		i['Time'] = time_diff(i['Time'])

	# page paras
	informs_num = Inform.get_informs_num(session['user_id'])
	#return str(informs_num)
	total_page = int(math.ceil(informs_num / num_per_page))
	pre_page   = (page - 1) if page > 1 else 1
	if total_page == 0:
		next_page = 1
	elif page < total_page:
		next_page = page + 1
	else:
		next_page = total_page

	new_informs_num = Inform.get_new_informs_num(session['user_id'])

	Inform.update_check_inform_time(session['user_id'])

	return render_template('informs.html', informs=informs, new_informs_num=new_informs_num, page=page, total_page=total_page, pre_page=pre_page, next_page=next_page)