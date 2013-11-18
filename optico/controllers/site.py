#-*- coding: UTF-8 -*-

import smtplib
from email.mime.text import MIMEText
from flask import render_template, request, redirect, url_for
from optico import app
from optico.models import Mtype
import config

# page home
#--------------------------------------------------

# view (public)
@app.route('/')
def home():
    mtypes = Mtype.query.all()
    return render_template('site/home.html', mtypes=mtypes)

# page service
#--------------------------------------------------

# view (public)
@app.route('/service')
def service():
    return render_template('site/service.html')

# page careers
#--------------------------------------------------

# view (public)
@app.route('/careers')
def careers():
    return render_template('site/careers.html')


# page about
#--------------------------------------------------

# view (public)
@app.route('/about')
def about():
    return render_template('site/about.html')

# page contact
#--------------------------------------------------

# view (public)
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'GET':
        return render_template('site/contact.html')
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


# 404 error
@app.errorhandler(404)
def page_404(error):
    return render_template('site/404.html'), 404


# 500 error
@app.errorhandler(500)
def page_500(error):
    return render_template('site/500.html'), 500