from sqlalchemy import create_engine, MetaData, Table

engine = create_engine('mysql+mysqldb://root:xiaowangzi@localhost/optico', echo=True)

metadata = MetaData(bind=engine)

product = Table('product', metadata, autoload=True)

conn = engine.connect()
result = conn.execute(product.insert(), ProductName='optico')
print result.inserted_primary_key
