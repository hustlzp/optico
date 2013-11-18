#-*- coding: UTF-8 -*-
from flask import render_template, request, redirect, url_for, session
from optico import app
import config


@app.route('/login', methods=['GET', 'POST'])
def login():
    """Page: login"""
    if request.method == 'GET':
        return render_template('sign/login.html')
    elif request.method == 'POST':
        user = request.form['user']
        pwd = request.form['pwd']
        if user == config.ADMIN and pwd == config.PWD:
            # set session
            session.permanent = True
            session['user_id'] = config.ADMIN_ID
            return redirect(url_for('home'))
        else:
            return redirect(url_for('login'))


@app.route('/logout')
def logout():
    """Proc: logout"""
    session.pop('user_id', None)
    return redirect(url_for('home'))