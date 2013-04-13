#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json

from xichuangzhu import app

@app.errorhandler(404)
def page_404(error):
	return render_template('404.html'), 404

@app.errorhandler(500)
def page_500(error):
	return render_template('500.html'), 500

