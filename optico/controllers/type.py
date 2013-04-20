#-*- coding: UTF-8 -*-

from flask import render_template, request, redirect, url_for, json, session, jsonify


from optico import app

from optico.models.product_model import Product
from optico.models.type_model import Type

from optico.utils import check_admin

# page main type
#--------------------------------------------------

# view (public)
@app.route('/maintype/<int:mtype_id>')
def mtype(mtype_id):
	mt = Type.get_mtype_by_id(mtype_id)
	products = Product.get_by_mtype(mtype_id)

	# build products sidebar
	ps = Type.get_mtypes()
	for m in ps:
		m['stypes'] = Type.get_stypes(m['MainTypeID'])
		for s in m['stypes']:
			s['products'] = Product.get_by_stype(s['SubTypeID'])
	return render_template('mtype.html', mt=mt, products=products, ps=ps)

# page add main type
#--------------------------------------------------

# view (admin)
@app.route('/maintype/add', methods=['GET', 'POST'])
def add_mtype():
	check_admin()
	if request.method == 'GET':
		return render_template('add_mtype.html')
	elif request.method == 'POST':
		name = request.form['name']
		img_url = request.form['img_url']
		Type.add_mtype(name, img_url)
		return redirect(url_for('home'))

# page edit main type
#--------------------------------------------------

# view (admin)
@app.route('/maintype/edit/<int:mtype_id>', methods=['GET', 'POST'])
def edit_mtype(mtype_id):
	check_admin()
	if request.method == 'GET':
		mt = Type.get_mtype_by_id(mtype_id)
		return render_template('edit_mtype.html', mt=mt)
	elif request.method == 'POST':
		name = request.form['name']
		img_url = request.form['img_url']
		Type.edit_mtype(mtype_id, name, img_url)
		return redirect(url_for('mtype', mtype_id=mtype_id))

# proc delete main type
#--------------------------------------------------
@app.route('/maintype/delete/<int:mtype_id>')
def delete_mtype(mtype_id):
	check_admin()
	Type.delete_mtype(mtype_id)
	return redirect(url_for('home'))

# page sub type
#--------------------------------------------------

# view (public)
@app.route('/subtype/<int:stype_id>')
def stype(stype_id):
	st = Type.get_stype_by_id(stype_id)
	mt = Type.get_mtype_by_id(st['MainTypeID'])
	products = Product.get_by_stype(stype_id)

	# build products sidebar
	ps = Type.get_mtypes()
	for m in ps:
		m['stypes'] = Type.get_stypes(m['MainTypeID'])
		for s in m['stypes']:
			s['products'] = Product.get_by_stype(s['SubTypeID'])
	return render_template('stype.html', st=st, mt=mt, products=products, ps=ps)

# page add sub type
#--------------------------------------------------

# view (admin)
@app.route('/subtype/add', methods=['GET', 'POST'])
def add_stype():
	check_admin()
	if request.method == 'GET':
		mtypes = Type.get_mtypes()
		return render_template('add_stype.html', mtypes=mtypes)
	elif request.method == 'POST':
		mtype_id = request.form['mtype_id']
		name = request.form['name']
		new_id = Type.add_stype(mtype_id, name)
		return redirect(url_for('stype', stype_id=new_id))

# page edit sub type
#--------------------------------------------------

# view (admin)
@app.route('/subtype/edit/<int:stype_id>', methods=['GET', 'POST'])
def edit_stype(stype_id):
	check_admin()
	if request.method == 'GET':
		mtypes = Type.get_mtypes()
		st = Type.get_stype_by_id(stype_id)
		return render_template('edit_stype.html', st=st, mtypes=mtypes)
	elif request.method == 'POST':
		mtype_id = request.form['mtype_id']
		name = request.form['name']
		Type.edit_stype(stype_id, mtype_id, name)
		return redirect(url_for('stype', stype_id=stype_id))

# proc delete main type
#--------------------------------------------------
@app.route('/subtype/delete/<int:stype_id>')
def delete_stype(stype_id):
	check_admin()
	Type.delete_stype(stype_id)
	return redirect(url_for('home'))