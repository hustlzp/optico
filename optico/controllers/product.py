#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json, session

from optico import app

from optico.models.product_model import Product

from optico.utils import check_admin

# page add product
#--------------------------------------------------

# view (admin)
@app.route('/product/add', methods=['GET', 'POST'])
def add_product():
	if request.method == 'GET':
		return render_template('add_product.html')
	elif request.method == 'POST':
		type_id = request.form['type_id']
		name = request.form['name']
		image_url = request.form['image_url']
		desc = request.form['description']
		details = request.form['details']
		src_url = request.form['src_url']
		
		new_id = Product.add(type_id, name, image_url, desc, details, src_url)
		return str(new_id)
