from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import declarative_base
import os



engine = create_engine(f'mysql+pymysql://root:@localhost:3306/an')
print("Conexión exitosa")
db_session = scoped_session(sessionmaker(engine))

Database = declarative_base()