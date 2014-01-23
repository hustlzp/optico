# coding: utf-8
from flask import render_template, request, redirect, url_for, json
from optico import app, images, db
from optico.models import Mtype, Product, ProductParamter
from optico.utils import check_admin


@app.route('/product/<int:product_id>')
def product(product_id):
    """Page: single product"""
    p = Product.query.get_or_404(product_id)
    ps = Mtype.query.order_by(Mtype.show_order).all()
    return render_template('product/product.html', p=p, ps=ps)


@app.route('/products')
def products():
    """Page: all products"""
    products = Product.query.all()
    ps = Mtype.query.order_by(Mtype.show_order).all()
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
    for mt in Mtype.query.order_by(Mtype.show_order):
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


@app.route('/product/<int:product_id>/add_para', methods=['POST'])
def add_para(product_id):
    """Proc: manage product parameters"""
    check_admin()
    para = ProductParamter(product_id=product_id, key=request.form['key'], value=request.form['value'])
    db.session.add(para)
    db.session.commit()
    return redirect(url_for('product', product_id=product_id))


@app.route('/para/<int:para_id>/edit', methods=['GET', 'POST'])
def edit_para(para_id):
    """Page: edit product parameter"""
    check_admin()
    para = ProductParamter.query.get_or_404(para_id)
    if request.method == 'GET':
        return render_template('product/edit_para.html', para=para)
    else:
        para.key = request.form['key']
        para.value = request.form['value']
        db.session.add(para)
        db.session.commit()
        return redirect(url_for('product', product_id=para.product_id))


@app.route('/para/<int:para_id>/delete')
def delete_para(para_id):
    """Page: delete product parameter"""
    check_admin()
    para = ProductParamter.query.get_or_404(para_id)
    db.session.delete(para)
    db.session.commit()
    return redirect(url_for('product', product_id=para.product_id))