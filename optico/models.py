# coding: utf-8
from optico import db, images
import textile
import markdown2


class Mtype(db.Model):
    """Model for main product type"""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    image = db.Column(db.String(100))
    show_order = db.Column(db.Integer)

    @property
    def image_url(self):
        return images.url(self.image)

    def __repr__(self):
        return '<Mtype %s>' % self.name


class Stype(db.Model):
    """Model for sub product type"""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    show_order = db.Column(db.Integer)

    mtype_id = db.Column(db.Integer, db.ForeignKey('mtype.id'))
    mtype = db.relationship('Mtype', backref=db.backref('stypes', lazy='dynamic',
                                                        order_by="Stype.show_order",
                                                        cascade="all, delete, delete-orphan"))

    def __repr__(self):
        return '<Stype %s>' % self.name


class Product(db.Model):
    """Model for product"""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    image = db.Column(db.String(100))
    desc = db.Column(db.Text)
    show_order = db.Column(db.Integer)

    stype_id = db.Column(db.Integer, db.ForeignKey('stype.id'))
    stype = db.relationship('Stype', backref=db.backref('products', lazy='dynamic',
                                                        order_by="Product.show_order",
                                                        cascade="all, delete, delete-orphan"))

    @property
    def friendly_desc(self):
        return markdown2.markdown(self.desc)

    @property
    def image_url(self):
        return images.url(self.image)

    def __repr__(self):
        return '<Product %s>' % self.name


class ProductParamter(db.Model):
    """Model for product paramter"""
    id = db.Column(db.Integer, primary_key=True)
    key = db.Column(db.String(50))
    value = db.Column(db.Text)

    product_id = db.Column(db.Integer, db.ForeignKey('product.id'))
    product = db.relationship('Product', backref=db.backref('paramters', lazy='dynamic',
                                                            cascade="all, delete, delete-orphan"))

    @property
    def friendly_value(self):
        return textile.textile(self.value)

    def __repr__(self):
        return '<Product Paramter %s>' % self.id


class Carousel(db.Model):
    """Model for carousel displaying in home page"""
    id = db.Column(db.Integer, primary_key=True)
    image = db.Column(db.String(100))

    @property
    def image_url(self):
        return images.url(self.image)

    def __repr__(self):
        return '<Carousel %s>' % self.id