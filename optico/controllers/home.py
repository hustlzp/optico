#-*- coding: UTF-8 -*-

import smtplib
from email.mime.text import MIMEText
from flask import render_template, request, redirect, url_for, json
from optico import app
from optico.models.type_model import Type
from optico.models.carousel_model import Carousel
from optico.utils import convert_dict
import config

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def home():
	mtypes = convert_dict(Type.get_mtypes())
	for mt in mtypes:
		mt['stypes'] = convert_dict(Type.get_stypes(mt['MainTypeID']))
	return render_template('home.html', mtypes=mtypes)

# page service
#--------------------------------------------------

# view (public)
@app.route('/service')
def service():
	return render_template('service.html')

# page careers
#--------------------------------------------------

# view (public)
@app.route('/careers')
def careers():
	return render_template('careers.html')


# page about
#--------------------------------------------------

# view (public)
@app.route('/about')
def about():
	return render_template('about.html')

# page contact
#--------------------------------------------------

# view (public)
@app.route('/contact', methods=['GET', 'POST'])
def contact():
	if request.method == 'GET':
		return render_template('contact.html')
	else:
		name = request.form['name']
		email = request.form['email']
		company = request.form['company']
		comments = request.form['comments']

		# prepare email content
		msgText = '''<html>
			<p>Name: %s</p>
			<p>Email: %s</p>
			<p>Company: %s</p>
			<p>Comments: %s</p>
			</html>''' % (name, email, company, comments)
		msg = MIMEText(msgText, 'html', 'utf-8')
		msg['From'] = "%s<%s>" % (name, email)
		msg['To'] = "sales<%s>" % config.EMAIL_SALES 
		msg['Subject'] = "Customer Contact"

		# send email
		s = smtplib.SMTP(config.SMTP_SERVER, config.SMTP_PORT)
		s.login(config.SMTP_USER, config.SMTP_PASSWORD)
		s.sendmail(config.SMTP_USER, config.EMAIL_SALES, msg.as_string())
		return redirect(url_for('home'))