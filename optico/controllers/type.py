#-*- coding: UTF-8 -*-
from flask import render_template, request, redirect, url_for
from optico import app, db, images
import config
from optico.models import Mtype, Stype
from optico.utils import check_admin


@app.route('/mtype/<int:mtype_id>')
def mtype(mtype_id):
    """Page: main product type"""
    mt = Mtype.query.get_or_404(mtype_id)
    ps = Mtype.query.order_by(Mtype.show_order).all()
    return render_template('type/mtype.html', mt=mt, ps=ps)


@app.route('/mtype/add', methods=['GET', 'POST'])
def add_mtype():
    """Page: add main product type"""
    check_admin()
    if request.method == 'GET':
        return render_template('type/add_mtype.html')
    elif request.method == 'POST':
        # Save image
        max_id = db.session.query(db.func.max(Mtype.id).label('max_id')).one().max_id
        filename = images.save(request.files['image'], name='m%s.' % str(max_id + 1))

        # Add mtype
        mtype = Mtype(name=request.form['name'], image=filename, show_order=request.form['order'])
        db.session.add(mtype)
        db.session.commit()
        return redirect(url_for('home'))


@app.route('/maintype/edit/<int:mtype_id>', methods=['GET', 'POST'])
def edit_mtype(mtype_id):
    """Page: edit main product type"""
    check_admin()
    mt = Mtype.query.get_or_404(mtype_id)
    if request.method == 'GET':
        return render_template('type/edit_mtype.html', mt=mt)
    else:
        # Delete old image
        # TODO

        # Save new image
        image = request.files['image']
        if image.filename:
            filename = images.save(image, name='m%s.' % str(mtype_id))
            mt.image = filename

        # Update mtype
        mt.name = request.form['name']
        mt.show_order = request.form['show_order']
        db.session.add(mt)
        db.session.commit()
        return redirect(url_for('home'))


@app.route('/mtype/<int:mtype_id>/delete')
def delete_mtype(mtype_id):
    """Proc: delete main product type"""
    check_admin()

    # Try to delete img file
    # TODO

    mtype = Mtype.query.get_or_404(mtype_id)
    db.session.delete(mtype)
    db.session.commit()
    return redirect(url_for('home'))


@app.route('/stype/<int:stype_id>')
def stype(stype_id):
    """Page: sub product type"""
    st = Stype.query.get_or_404(stype_id)
    ps = Mtype.query.order_by(Mtype.show_order).all()
    return render_template('type/stype.html', st=st, ps=ps)


@app.route('/stype/add', methods=['GET', 'POST'])
def add_stype():
    """Page: add sub product type"""
    check_admin()
    if request.method == 'GET':
        mtypes = Mtype.query.order_by(Mtype.show_order).all()
        return render_template('type/add_stype.html', mtypes=mtypes)
    elif request.method == 'POST':
        stype = Stype(mtype_id=request.form['mtype_id'], name=request.form['name'], show_order=request.form['show_order'])
        db.session.add(stype)
        db.session.commit()
        return redirect(url_for('stype', stype_id=stype.id))


@app.route('/stype/<int:stype_id>/edit', methods=['GET', 'POST'])
def edit_stype(stype_id):
    """Page: edit sub product type"""
    check_admin()
    st = Stype.query.get_or_404(stype_id)
    if request.method == 'GET':
        mtypes = Mtype.query.order_by(Mtype.show_order).all()
        return render_template('type/edit_stype.html', st=st, mtypes=mtypes)
    elif request.method == 'POST':
        st.mtype_id = request.form['mtype_id']
        st.name = request.form['name']
        st.show_order = request.form['show_order']
        db.session.add(st)
        db.session.commit()
        return redirect(url_for('stype', stype_id=stype_id))


@app.route('/subtype/delete/<int:stype_id>')
def delete_stype(stype_id):
    """Proc: delete sub product type"""
    check_admin()
    stype = Stype.query.get_or_404(stype_id)
    db.session.delete(stype)
    db.session.commit()
    return redirect(url_for('home'))