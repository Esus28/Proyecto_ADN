from database import Database

from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy import Date
from sqlalchemy import Float

#-------- MODELS USUARIOS---------#
class Usuario(Database):
    __tablename__ = 'usuarios'
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    usuario = Column(String(50), unique=True, nullable=False)
    rol = Column(String(20), nullable=False)
    password = Column(String(100), nullable=False)

    def __repr__(self):
        return f'<Usuario {self.usuario}>'


#-------- MODELS REPARTIDORES---------#
class Repartidor(Database):
    __tablename__ = 'repartidores'  

    id_repartidor = Column(Integer, primary_key=True, autoincrement=True)  
    nombre = Column(String(100), nullable=False)  
    apellidos = Column(String(100), nullable=False)  
    no_licencia = Column(String(15), nullable=False, unique=True)  
    telefono = Column(String(10), nullable=False, unique=True)  
    foto = Column(String(255), nullable=True)  

    def __repr__(self):
        return f"<Repartidor(id_repartidor={self.id_repartidor}, nombre={self.nombre}, apellidos={self.apellidos}, no_licencia={self.no_licencia}, telefono={self.telefono})>"
    

   #-------- MODELS VENDEDORES---------# 
class Vendedor(Database):
    __tablename__='vendedores' 

    id_vendedor = Column(Integer, primary_key=True, autoincrement=True) 
    nombre = Column(String(100), nullable=False) 
    apellidos = Column(String(100), nullable=False)  
    telefono = Column(String(15), nullable=False, unique=True)  
    foto = Column(String(255), nullable=True) 

    clientes = relationship('Cliente', back_populates='vendedor')

    def __repr__(self):
        return f"<Vendedor(id_vendedor={self.id_vendedor}, nombre={self.nombre}, apellidos={self.apellidos} telefono={self.telefono})>"
    

   #-------- MODELS CLIENTES---------# 
class Cliente(Database):
    __tablename__ = 'clientes'

    id_cliente = Column(Integer, primary_key=True, autoincrement=True)
    nombre = Column(String(100), nullable=False)
    apellidos = Column(String(100), nullable=False)
    telefono = Column(String(15), nullable=False)
    correo = Column(String(100), nullable=False, unique=True)
    ubicacion = Column(String(255), nullable=True)
    municipio = Column(String(100), nullable=False)
    codigo_postal = Column(String(10), nullable=False)
    vendedor_id = Column(Integer, ForeignKey('vendedores.id_vendedor'), nullable=False)

    vendedor = relationship('Vendedor', back_populates='clientes')
    # Relación con la tabla de Costos
    costos = relationship('Costo', back_populates='cliente')

    # Relación con la tabla de Rutas
    rutas = relationship('Ruta', back_populates='cliente')

    def __repr__(self):
        return f"<Cliente(id_cliente={self.id_cliente}, nombre={self.nombre}, apellidos={self.apellidos}, telefono={self.telefono}correo={self.correo}, ubicacion={self.ubicacion}, municipio={self.municipio}, codigo_postal={self.codigo_postal}, vendedor_id={self.vendedor_id})>"


#-------- MODELS VEHICULOS---------# 
class Vehiculo(Database):
    __tablename__ = 'vehiculos'

    id_vehiculo = Column(Integer, primary_key=True, autoincrement=True)
    modelo = Column(String(100), nullable=False)
    placas = Column(String(20), nullable=False, unique=True)
    ultimo_servicio = Column(Date, nullable=False)
    prox_verifi = Column(Date, nullable=False)
    ultima_tenencia = Column(Date, nullable=False)

    def __repr__(self):
        return f"<Vehiculo(id_vehiculo={self.id_vehiculo}, modelo={self.modelo}, placas={self.placas}, ultimo_servicio={self.ultimo_servicio}, prox_verifi={self.prox_verifi}, ultima_tenencia={self.ultima_tenencia})>"
    

#-------- MODELS COSTOS---------# 

class Costo(Database):
    __tablename__ = 'costos'

    id_costo = Column(Integer, primary_key=True, autoincrement=True)
    prec_gasolina = Column(Float, nullable=False)
    prec_caseta = Column(Float, nullable=False)
    lugar_salida = Column(String(100), nullable=False)
    lugar_llegada = Column(String(100), nullable=False)
    distancia = Column(Float, nullable=False)  # en kilómetros
    tiempo = Column(Float, nullable=False)  # en horas
    total_costo = Column(Float, nullable=False)  # costo total
    cliente_id = Column(Integer, ForeignKey('clientes.id_cliente'), nullable=False)

    # Relación con la tabla Cliente
    cliente = relationship('Cliente', back_populates='costos')

    def __repr__(self):
        return f"<Costo(id_costo={self.id_costo}, prec_gasolina={self.prec_gasolina}, prec_caseta={self.prec_caseta}, lugar_salida={self.lugar_salida}, lugar_llegada={self.lugar_llegada}, distancia={self.distancia}, tiempo={self.tiempo}, total_costo={self.total_costo}, cliente_id={self.cliente_id})>"


#-------- MODELS RUTAS---------# 
class Ruta(Database):
    __tablename__ = 'rutas'

    id_ruta = Column(Integer, primary_key=True, autoincrement=True)
    num_ruta = Column(Integer, nullable=False)  # Número de la ruta
    grupos_rutas = Column(String(100), nullable=False)  # Descripción o grupo de la ruta
    tiempo_est = Column(Float, nullable=False)  # Tiempo estimado en horas
    cliente_id = Column(Integer, ForeignKey('clientes.id_cliente'), nullable=False)

    # Relación con la tabla Cliente
    cliente = relationship('Cliente', back_populates='rutas')

    def __repr__(self):
        return f"<Ruta(id_ruta={self.id_ruta}, num_ruta={self.num_ruta},grupos_rutas={self.grupos_rutas}, tiempo_est={self.tiempo_est}, cliente_id={self.cliente_id})>"
    



