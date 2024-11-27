from flask import Flask
from flask import request 
from flask import render_template
from flask import redirect
from flask import url_for
from database import db_session
from werkzeug.utils import secure_filename
from flask import flash, session




from database import Database
from database import engine

import models
import os

app = Flask(__name__)

SESSION_TYPE = 'filesystem'
PROFILE_PICTURES_FOLDER = 'static/fotos_repartidores'
ALLOWED_IMAGE_TYPES = ['png', 'jpg', 'jpeg','JPEG', 'JPG ']
app.secret_key = 'dmo5S4DxuD^9IWK1k33o7Xg88J&D8fq!'

def allowed_file(file):
    file = file.split('.')
    if file[1] in ALLOWED_IMAGE_TYPES:
        return True
    
def lista_Archivos():
    urlFiles = 'static/fotos_repartidores'
    return(os.listdir(urlFiles)) 

Database.metadata.create_all(engine)


@app.route('/')
def home():
    return render_template('login.html')




@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    # Buscar el usuario en la base de datos
    user = db_session.query(models.Usuario).filter_by(usuario=username).first()

    if user:
   
        if user.password == password:
            session['user_id'] = user.id
            session['username'] = user.usuario
            session['rol'] = user.rol
            flash('Inicio de sesión exitoso', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Contraseña incorrecta', 'danger')
            print('Contrasñea incorrecta')
    else:
        flash('Usuario no encontrado', 'danger')
        print('no esta')

    return redirect(url_for('home'))  # Redirigir de vuelta al formulario de login si falla



# Ruta del dashboard
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:

        return redirect(url_for('login'))
    repartidores = db_session.query(models.Repartidor)
    return render_template('dashboard.html', username=session['username'], rol=session['rol'],repartidores=repartidores)


#------FORMULARIO PARA AGREGAR A UN NUEVO REPARTIDOR-----#
@app.route('/agregar_repartidor', methods=['GET', 'POST'])
def agregar_repartidor():
    if request.method == 'GET':
        return render_template('agregar_repartidor.html')

    # Capturar datos del formulario (POST)
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    foto = request.files.get('foto')  # Capturar la foto subida

    # Verificar que todos los campos tengan valores
    if not (nombre and apellidos and telefono and foto):
        flash('Todos los campos son obligatorios.', 'error')
        return redirect(url_for('agregar_repartidor'))

    # Guardar la foto en una carpeta estática
    foto_path = os.path.join('static', 'fotos_repartidores', secure_filename(foto.filename))
    foto.save(foto_path)

    # Crear un nuevo repartidor
    nuevo_repartidor = Repartidor(
        nombre=nombre,
        apellidos=apellidos,
        telefono=telefono,
        foto=foto_path
    )

    # Guardar en la base de datos
    db_session.add(nuevo_repartidor)
    db_session.commit()

    flash('Repartidor agregado exitosamente.', 'success')
    return redirect(url_for('lista_repartidores'))



@app.route('/vendedores')
def vendedores():
    vendedores = db_session.query(models.Vendedor)
    return render_template('vendedores.html', vendedores=vendedores)


@app.route('/clientes')
def clientes(): 
    clientes = db_session.query(models.Cliente)
    return render_template('clientes.html', clientes=clientes)

@app.route('/vehiculos')
def vehiculos(): 
    vehiculos = db_session.query(models.Vehiculo)
    return render_template('vehiculos.html', vehiculos=vehiculos)

@app.route('/costos')
def costos(): 
    costos = db_session.query(models.Costo)
    return render_template('costos.html', costos=costos)

@app.route('/rutas')
def rutas(): 
    rutas = db_session.query(models.Ruta)
    return render_template('rutas.html', rutas=rutas)
   
if __name__ == '__main__':
    app.run('0.0.0.0', 8081, debug=True)