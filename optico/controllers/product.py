#-*- coding: UTF-8 -*-

import os
from flask import render_template, request, redirect, url_for, json
from optico import app, images, db
import config
from optico.models import Product, Mtype
from optico.utils import check_admin, build_pimg_filename


@app.route('/product/<int:product_id>')
def product(product_id):
    """Page: single product"""
    p = Product.query.get_or_404(product_id)
    ps = Mtype.query.all()
    return render_template('product/product.html', p=p, ps=ps)


@app.route('/products')
def products():
    """Page: all products"""
    products = Product.query.all()
    ps = Mtype.query.all()
    return render_template('product/products.html', products=products, ps=ps)


@app.route('/product/search', methods=['POST'])
def search_products():
    """Page: search for products"""
    keyword = request.form['keyword']
    products = Product.query.filter(Product.name.like('%%%s%%' % keyword))
    return render_template('product/search.html', keyword=keyword, products=products)


def build_mtype_json():
    """Build the json data of mtypes and its stypes"""
    mtypes = []
    for mt in Mtype.query:
        mtype = {'id': mt.id, 'name': mt.name, 'stypes': []}
        for st in mt.stypes:
            stype = {'id': st.id, 'name': st.name}
            mtype['stypes'].append(stype)
        mtypes.append(mtype)
    return json.dumps(mtypes)


@app.route('/product/add', methods=['GET', 'POST'])
def add_product():
    """Page: add product"""
    check_admin()
    if request.method == 'GET':
        mtypes = build_mtype_json()
        return render_template('product/add_product.html', mtypes=mtypes)
    else:
        # Save image
        max_id = db.session.query(db.func.max(Product.id).label('max_id')).one().max_id
        filename = images.save(request.files['image'], name='p%s.' % str(max_id + 1))

        # Add product
        product = Product(stype_id=request.form['stype_id'], name=request.form['name'], desc=request.form['desc'],
                          image=filename, show_order=request.form['show_order'])
        db.session.add(product)
        db.session.commit()
        return redirect(url_for('product', product_id=product.id))


@app.route('/product/<int:product_id>/edit', methods=['GET', 'POST'])
def edit_product(product_id):
    """Page: edit product"""
    check_admin()
    p = Product.query.get_or_404(product_id)
    if request.method == 'GET':
        mtypes = build_mtype_json()
        return render_template('product/edit_product.html', p=p, mtypes=mtypes)
    else:
        # Delete old image
        # TODO

        # Save new image
        image = request.files['image']
        if image.filename:
            filename = images.save(image, name='p%s.' % str(p.id))
            p.image = filename

        # Update product
        p.stype_id = request.form['stype_id']
        p.name = request.form['name']
        p.desc = request.form['desc']
        p.show_order = request.form['show_order']
        db.session.add(p)
        db.session.commit()
        return redirect(url_for('product', product_id=product_id))


@app.route('/product/<int:product_id>/delete')
def delete_product(product_id):
    """Page: delete product"""
    check_admin()

    # Delete image file
    # TODO

    # Delete product
    product = Product.query.get_or_404(product_id)
    db.session.delete(product)
    db.session.commit()
    return redirect(url_for('home'))

# page manage product parameters
#--------------------------------------------------

# view (admin)
@app.route('/product/<int:product_id>/add_para', methods=['POST'])
def add_para(product_id):
    check_admin()
    title = request.form['title']
    content = request.form['content']
    Product.add_para(product_id, title, content)
    return redirect(url_for('product', product_id=product_id))

# page edit product parameter
#--------------------------------------------------

# view (public)
@app.route('/para/<int:para_id>/edit', methods=['GET', 'POST'])
def edit_para(para_id):
    check_admin()
    para = Product.get_para_by_id(para_id)
    if request.method == 'GET':
        return render_template('product/edit_para.html', para=para)
    else:
        title = request.form['title']
        content = request.form['content']
        Product.edit_para(para_id, title, content)
        return redirect(url_for('product', product_id=para.ProductID))

# page delete product parameter
#--------------------------------------------------

# view (admin)
@app.route('/para/<int:para_id>/delete')
def delete_para(para_id):
    check_admin()
    product_id = Product.get_para_by_id(para_id)['ProductID']
    Product.delete_para(para_id)
    return redirect(url_for('product', product_id=product_id))