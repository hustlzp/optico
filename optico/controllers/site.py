# coding: utf-8
import smtplib
from email.mime.text import MIMEText
from flask import render_template, request, redirect, url_for, flash
from optico import app
from optico.models import Mtype
from .. import config


@app.route('/')
def home():
    """Page: home"""
    mtypes = Mtype.query.order_by(Mtype.show_order).all()
    return render_template('site/home.html', mtypes=mtypes)


@app.route('/service')
def service():
    """Page: service"""
    return render_template('site/service.html')


@app.route('/careers')
def careers():
    """Page: careers"""
    return render_template('site/careers.html')


@app.route('/about')
def about():
    """Page: about"""
    return render_template('site/about.html')


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    """Page: contact"""
    if request.method == 'GET':
        return render_template('site/contact.html')
    else:
        name = request.form['name']
        email = request.form['email']
        company = request.form['company']
        comments = request.form['comments']

        # prepare email content
        msg_text = '''<html>
            <p>Name: %s</p>
            <p>Email: %s</p>
            <p>Company: %s</p>
            <p>Comments: %s</p>
            </html>''' % (name, email, company, comments)
        msg = MIMEText(msg_text, 'html', 'utf-8')
        msg['From'] = "%s<%s>" % (name, email)
        msg['To'] = "sales<%s>" % config.EMAIL_SALES
        msg['Subject'] = "Customer Contact"

        # send email
        s = smtplib.SMTP(config.SMTP_SERVER, config.SMTP_PORT)
        s.login(config.SMTP_USER, config.SMTP_PASSWORD)
        s.sendmail(config.SMTP_USER, config.EMAIL_SALES, msg.as_string())
        flash('Thank you for your comments, we will contact with you soon !')
        return redirect(url_for('contact'))


@app.errorhandler(404)
def page_404(error):
    """Page: 404 error"""
    return render_template('site/404.html'), 404


@app.errorhandler(500)
def page_500(error):
    """Page: 500 error"""
    return render_template('site/500.html'), 500