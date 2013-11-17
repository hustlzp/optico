#-*- coding: UTF-8 -*-

import os
from flask import render_template, request, redirect, url_for, json, abort
from optico import app
import config
from optico.models import Product, Mtype
from optico.utils import check_admin, build_pimg_filename

# page product
#--------------------------------------------------

# view (public)
@app.route('/product/<int:product_id>')
def product(product_id):
    p = Product.query.get_or_404(product_id)
    ps = Mtype.query.all()
    return render_template('product/product.html', p=p, ps=ps)

# page products
#--------------------------------------------------

# view (public)
@app.route('/products')
def products():
    products = Product.query.all()
    ps = Mtype.query.all()
    return render_template('product/products.html', products=products, ps=ps)

# page search products
#--------------------------------------------------

# view (public)
@app.route('/products/search', methods=['POST'])
def search_products():
    keyword = request.form['keyword']
    products = Product.query.filter(Product.name.like('%%%s%%' % keyword))
    return render_template('product/search.html', keyword=keyword, products=products)

# page add product
#--------------------------------------------------

# view (admin)
@app.route('/product/add', methods=['GET', 'POST'])
def add_product():
    check_admin()
    if request.method == 'GET':
        # all types
        mtypes = Type.get_mtypes()
        for mt in mtypes:
            mt['stypes'] = Type.get_stypes(mt['MainTypeID'])
        return render_template('add_product.html', mtypes=json.dumps(mtypes))
    else:
        # Add product
        mtype_id = request.form['mtype_id']
        stype_id = request.form['stype_id']
        name = request.form['name']
        order = request.form['order']
        desc = request.form['description']
        details = request.form['details']
        src_url = request.form['src_url']
        new_id = Product.add(mtype_id, stype_id, name, order, desc, details, src_url)

        # Save image
        image = request.files['image']
        image_filename = build_pimg_filename(new_id, image.filename)
        image.save(config.IMAGE_PATH + image_filename)

        # Update image url
        image_url = config.IMAGE_URL + image_filename
        Product.update_product_img_url(new_id, image_url)

        return redirect(url_for('product', product_id=new_id))

# page edit product
#--------------------------------------------------

# view (admin)
@app.route('/product/<int:product_id>/edit', methods=['GET', 'POST'])
def edit_product(product_id):
    check_admin()
    if request.method == 'GET':
        p = Product.get_by_id(product_id)
        # all types
        mtypes = Type.get_mtypes()
        for mt in mtypes:
            mt['stypes'] = Type.get_stypes(mt['MainTypeID'])
        return render_template('product/edit_product.html', p=p, mtypes=json.dumps(mtypes))
    else:
        # Save image
        image = request.files['image']
        if image.filename:
            image_filename = build_pimg_filename(product_id, image.filename)
            image.save(config.IMAGE_PATH + image_filename)
            image_url = config.IMAGE_URL + image_filename
        else:
            image_url = Product.get_by_id(product_id)['ImageUrl']

        # Edit product
        mtype_id = request.form['mtype_id']
        stype_id = request.form['stype_id']
        name = request.form['name']
        order = request.form['order']
        desc = request.form['description']
        details = request.form['details']
        src_url = request.form['src_url']
        Product.edit(product_id, mtype_id, stype_id, name, order, image_url, desc, details, src_url)

        return redirect(url_for('product', product_id=product_id))

# page delete product
#--------------------------------------------------

# view (admin)
@app.route('/product/<int:product_id>/delete')
def delete_product(product_id):
    check_admin()

    # Delete image file
    image_filename = Product.get_by_id(product_id)['ImageUrl'].split('/')[-1]
    image_path = config.IMAGE_PATH + image_filename
    if os.path.isfile(image_path):
        os.remove(image_path)

    Product.delete(product_id)
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