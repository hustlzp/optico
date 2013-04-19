#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json, session, jsonify


from optico import app

from optico.models.product_model import Product
from optico.models.type_model import Type

from optico.utils import check_admin

# page product
#--------------------------------------------------

# view (public)
@app.route('/product/<int:product_id>')
def product(product_id):
	p = Product.get_by_id(product_id)
	return render_template('product.html', p=p)

# page add product
#--------------------------------------------------

# view (admin)
@app.route('/product/add', methods=['GET', 'POST'])
def add_product():
	if request.method == 'GET':
		# all types
		mtypes = Type.get_mtypes()
		for mt in mtypes:
			mt['stypes'] = Type.get_stypes(mt['MainTypeID'])
		return render_template('add_product.html', mtypes=json.dumps(mtypes))
	elif request.method == 'POST':
		mtype_id = request.form['mtype_id']
		stype_id = request.form['stype_id']
		name = request.form['name']
		image_url = request.form['image_url']
		desc = request.form['description']
		details = request.form['details']
		src_url = request.form['src_url']
		
		new_id = Product.add(mtype_id, stype_id, name, image_url, desc, details, src_url)
	return redirect(url_for('product', product_id=new_id))

# page add product
#--------------------------------------------------

# view (admin)
@app.route('/product/edit/<int:product_id>', methods=['GET', 'POST'])
def edit_product(product_id):
	if request.method == 'GET':
		p = Product.get_by_id(product_id)
		# all types
		mtypes = Type.get_mtypes()
		for mt in mtypes:
			mt['stypes'] = Type.get_stypes(mt['MainTypeID'])
		return render_template('edit_product.html', p=p, mtypes=json.dumps(mtypes))
	elif request.method == 'POST':
		mtype_id = request.form['mtype_id']
		stype_id = request.form['stype_id']
		name = request.form['name']
		image_url = request.form['image_url']
		desc = request.form['description']
		details = request.form['details']
		src_url = request.form['src_url']
		
		Product.edit(product_id, mtype_id, stype_id, name, image_url, desc, details, src_url)
	return redirect(url_for('product', product_id=product_id))
