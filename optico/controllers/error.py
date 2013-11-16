#-*- coding: UTF-8 -*-

from flask import render_template
from optico import app


# 404 error
@app.errorhandler(404)
def page_404(error):
    return render_template('404.html'), 404


# 500 error
@app.errorhandler(500)
def page_500(error):
    return render_template('500.html'), 500

