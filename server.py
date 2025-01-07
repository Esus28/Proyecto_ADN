from flask import Flask
from flask import request 
from flask import render_template
from flask import redirect
from flask import url_for
from database import db_session
from werkzeug.utils import secure_filename
from flask import flash, session
from datetime import datetime


from weasyprint import HTML

from flask import make_response
from database import Database
from database import engine

import json
import models
import os

app = Flask(__name__)

SESSION_TYPE = 'filesystem'
PROFILE_PICTURES_FOLDER = 'static/fotos_repartidores'
VENDEDORES_PICTURES_FOLDER = 'static/fotos_vendedores'
ALLOWED_IMAGE_TYPES = ['png', 'jpg', 'jpeg','JPEG', 'JPG ']
app.secret_key = 'dmo5S4DxuD^9IWK1k33o7Xg88J&D8fq!'

def allowed_file(file):
    file = file.split('.')
    if file[1] in ALLOWED_IMAGE_TYPES:
        return True
    
def lista_Archivos():
    urlFiles = 'static/fotos_repartidores'
    return(os.listdir(urlFiles)) 


def lista_vendores():
    urlFiles = 'static/foto_vendedores'
    return(os.listdir(urlFiles)) 

Database.metadata.create_all(engine)


@app.route('/')
def home():
    return render_template('login.html')




@app.route('/login', methods=['POST'])
def login():
    username = request.form.get('username')
    password = request.form.get('password')

    user = db_session.query(models.Usuario).filter_by(usuario=username).first()

    if user:
      
        if user.password == password:
            session['user_id'] = user.id
            session['username'] = user.usuario
            session['rol'] = user.rol
            print(f"Rol del usuario: {user.rol}")
  
        
            if user.rol == 'admin':
                flash('Inicio de sesión exitoso', 'success')
                print("1")
                return redirect(url_for('dashboard'))
            elif user.rol == 'sub': 
                flash('Inicio de sesión exitoso', 'success')
                print("2")
                return redirect(url_for('sub_sesion')) 
            else:
                flash('Rol desconocido', 'danger')
                print("3")
                return redirect(url_for('home'))  
        else:
            flash('Contraseña incorrecta', 'danger')
            print("4")
            print('Contraseña incorrecta')
    else:
        flash('Usuario no encontrado', 'danger')
        print('Usuario no encontrado')

    return redirect(url_for('home'))  



# -----------------------------------------RUTAS DEL ADMINISTRADOR-----------------------------
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:

        return redirect(url_for('login'))
    repartidores = db_session.query(models.Repartidor)
    
    return render_template('admin/dashboard.html', username=session['username'], rol=session['rol'],repartidores=repartidores)


@app.route('/agregar_repartidor', methods=['GET', 'POST'])
def agregar_repartidor():
    if request.method == 'GET':
        return render_template('admin/repartidores/agregar_repartidor.html')

    
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    foto = request.files.get('foto')
    no_licencia = request.form.get('no_licencia')

    if foto and allowed_file(foto.filename):
       
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')  
        nombre_archivo = f"{nombre}_{timestamp}{os.path.splitext(foto.filename)[1]}"
        filename = secure_filename(nombre_archivo) 

    
        foto.save(os.path.join(PROFILE_PICTURES_FOLDER, filename))
    else:
        filename = None 

   
    nuevo_repartidor = models.Repartidor(
        nombre=nombre,
        apellidos=apellidos,
        telefono=telefono,
        no_licencia=no_licencia,
        foto=filename  
    )

    db_session.add(nuevo_repartidor)
    db_session.commit()

    flash('Repartidor agregado exitosamente.', 'success')
    return redirect(url_for('dashboard'))


@app.route('/actualizar_repartidor/<id>', methods=['GET', 'POST'])
def actualizar_repartidor(id):
    repartidor = db_session.query(models.Repartidor).get(id) 

    if not repartidor:
        flash("El repartidor no existe.", "error")
        return redirect(url_for('dashboard'))

    if request.method == 'GET':
        return render_template('admin/repartidores/actualizar_repartidor.html', repartidor=repartidor)

    
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    no_licencia = request.form.get('no_licencia')
    foto = request.files.get('foto')

    
    if nombre and nombre.strip():
        repartidor.nombre = nombre
    if apellidos and apellidos.strip():
        repartidor.apellidos = apellidos
    if telefono and telefono.strip():
        repartidor.telefono = telefono
    if no_licencia and no_licencia.strip():
        repartidor.no_licencia = no_licencia


    if foto and allowed_file(foto.filename):

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        nuevo_nombre_foto = f"{repartidor.nombre.replace(' ', '_')}_{timestamp}{os.path.splitext(foto.filename)[1]}"
        nuevo_nombre_foto = secure_filename(nuevo_nombre_foto)

        
        if repartidor.foto:
            foto_anterior_path = os.path.join(PROFILE_PICTURES_FOLDER, repartidor.foto)
            if os.path.exists(foto_anterior_path):
                try:
                    os.remove(foto_anterior_path)
                except Exception as e:
                    flash(f"Error al eliminar la foto anterior: {str(e)}", "error")

    
        foto.save(os.path.join(PROFILE_PICTURES_FOLDER, nuevo_nombre_foto))
        repartidor.foto = nuevo_nombre_foto 

    db_session.add(repartidor)
    db_session.commit()

    flash('Repartidor editado exitosamente.', 'success')
    return redirect(url_for('dashboard'))

@app.get('/eliminar_repartidor/<id>')
def eliminar_repartidor(id):
  
    repartidor = db_session.query(models.Repartidor).get(id)
    
    if not repartidor:
        flash("El repartidor no existe.", "error")
        return redirect(url_for('dashboard'))
    
    foto_path = os.path.join(PROFILE_PICTURES_FOLDER, repartidor.foto) if repartidor.foto else None

    if foto_path and os.path.exists(foto_path):
        try:
            os.remove(foto_path)
        except Exception as e:
            flash(f"Error al eliminar la foto: {str(e)}", "error")
    
    db_session.delete(repartidor)
    db_session.commit()

    flash("Repartidor eliminado exitosamente.", "success")
    return redirect(url_for('dashboard'))



@app.route('/vendedores')
def vendedores():
    vendedores = db_session.query(models.Vendedor)
    return render_template('/admin/vendedores.html', vendedores=vendedores)


@app.route('/agregar_vendedor', methods=['GET', 'POST'])
def agregar_vendedor():
    if request.method == 'GET':
        return render_template('admin/vendedores/post.html')

    
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    foto = request.files.get('foto')
   

    if foto and allowed_file(foto.filename):
       
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')  
        nombre_archivo = f"{nombre}_{timestamp}{os.path.splitext(foto.filename)[1]}"
        filename = secure_filename(nombre_archivo) 

    
        foto.save(os.path.join(VENDEDORES_PICTURES_FOLDER, filename))
    else:
        filename = None 

   
    nuevo_vendedor = models.Vendedor(
        nombre=nombre,
        apellidos=apellidos,
        telefono=telefono,
        foto=filename  
    )

    db_session.add(nuevo_vendedor)
    db_session.commit()

    flash('Vendedor agregado exitosamente.', 'success')
    return redirect(url_for('vendedores'))



@app.route('/actualizar_vendedor/<id>', methods=['GET', 'POST'])
def actualizar_vendedor(id):
    vendedor = db_session.query(models.Vendedor).get(id) 

    if not vendedor:
        flash("El vendedor no existe.", "error")
        return redirect(url_for('dashboard'))

    if request.method == 'GET':
        return render_template('admin/vendedores/update.html', vendedor=vendedor)

    
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    foto = request.files.get('foto')

    
    if nombre and nombre.strip():
        vendedor.nombre = nombre
    if apellidos and apellidos.strip():
        vendedor.apellidos = apellidos
    if telefono and telefono.strip():
        vendedor.telefono = telefono
  

    if foto and allowed_file(foto.filename):

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        nuevo_nombre_foto = f"{vendedor.nombre.replace(' ', '_')}_{timestamp}{os.path.splitext(foto.filename)[1]}"
        nuevo_nombre_foto = secure_filename(nuevo_nombre_foto)

        
        if vendedor.foto:
            foto_anterior_path = os.path.join(VENDEDORES_PICTURES_FOLDER, vendedor.foto)
            if os.path.exists(foto_anterior_path):
                try:
                    os.remove(foto_anterior_path)
                except Exception as e:
                    flash(f"Error al eliminar la foto anterior: {str(e)}", "error")

    
        foto.save(os.path.join(VENDEDORES_PICTURES_FOLDER, nuevo_nombre_foto))
        vendedor.foto = nuevo_nombre_foto 

    db_session.add(vendedor)
    db_session.commit()

    flash('Repartidor editado exitosamente.', 'success')
    return redirect(url_for('vendedores'))


@app.get('/eliminar_vendedor/<id>')
def eliminar_vendedor(id):
  
    vendedor = db_session.query(models.Vendedor).get(id)
    
    if not vendedor:
        flash("El vendedor no existe.", "error")
        return redirect(url_for('dashboard'))
    
    foto_path = os.path.join(VENDEDORES_PICTURES_FOLDER, vendedor.foto) if vendedor.foto else None

    if foto_path and os.path.exists(foto_path):
        try:
            os.remove(foto_path)
        except Exception as e:
            flash(f"Error al eliminar la foto: {str(e)}", "error")
    
    db_session.delete(vendedor)
    db_session.commit()

    flash("Vendedor eliminado exitosamente.", "success")
    return redirect(url_for('vendedores'))

@app.get('/vista_rutas')
def vista_ruta():
    # Obtener los clientes desde la base de datos
    clientes = db_session.query(models.Cliente).all()

    # Recopilar los datos de latitud, longitud y nombre de cada cliente, asegurándose de convertir latitud y longitud a float
    datos_clientes = [
        {
            'latitud': float(cliente.latitud),  # Asegurarse de convertir a float
            'longitud': float(cliente.longitud),  # Asegurarse de convertir a float
            'nombre': cliente.nombre,
        }
        for cliente in clientes
    ]

    # No necesitas usar json.dumps porque el filtro 'tojson' de Jinja2 lo hace automáticamente
    return render_template('/admin/mapa.html', datos_clientes_json=datos_clientes)



@app.route('/clientes')
def clientes(): 
    clientes = db_session.query(models.Cliente)
    return render_template('/admin/clientes.html', clientes=clientes)


@app.route('/agregar_cliente', methods=['GET', 'POST'])
def agregar_cliente():
    if request.method == 'GET':
        vendedores = db_session.query(models.Vendedor)
        return render_template('admin/clientes/agregar_cliente.html', vendedores=vendedores)

    
    clave = request.form.get('clave')
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    correo = request.form.get('correo')
    municipio = request.form.get('municipio')
    codigo_postal = request.form.get('codigo_postal')
    clasificacion = request.form.get('clasificacion')
    vendedor_id = request.form.get('vendedor_id')
    tipo_entrega = request.form.get('tipo_entrega')
    latitud = request.form.get('latitud')
    longitud = request.form.get('longitud')
    

    
   
    nuevo_cliente = models.Cliente(
       clave = clave,
       nombre = nombre,
       apellidos = apellidos,
       telefono = telefono,
       correo = correo,
       municipio = municipio,
       codigo_postal = codigo_postal,
       clasificacion = clasificacion,
       vendedor_id = vendedor_id,
       tipo_entrega = tipo_entrega,
       latitud = latitud,
       longitud = longitud
    )

    db_session.add(nuevo_cliente)
    db_session.commit()

    flash('Vehículo agregado exitosamente.', 'success')
    return redirect(url_for('clientes'))


@app.route('/actualizar_cliente/<id>', methods=['GET', 'POST'])
def actualizar_cliente(id):
    cliente = db_session.query(models.Cliente).get(id) 

    if not cliente:
        flash("El cliente no existe.", "error")
        return redirect(url_for('clientes'))

    if request.method == 'GET':
        vendedores= db_session.query(models.Vendedor)
        return render_template('admin/clientes/actualizar_cliente.html', cliente=cliente, vendedores=vendedores)

     
    clave = request.form.get('clave')
    nombre = request.form.get('nombre')
    apellidos = request.form.get('apellidos')
    telefono = request.form.get('telefono')
    correo = request.form.get('correo')
    municipio = request.form.get('municipio')
    codigo_postal = request.form.get('codigo_postal')
    clasificacion = request.form.get('clasificacion')
    vendedor_id = request.form.get('vendedor_id')
    tipo_entrega = request.form.get('tipo_entrega')
    latitud = request.form.get('latitud')
    longitud = request.form.get('longitud')


    
    if clave and clave.strip():
        cliente.clave = clave
    if nombre and nombre.strip():
        cliente.nombre = nombre
    if apellidos and apellidos.strip():
        cliente.apellidos = apellidos
    if telefono and telefono.strip():
        cliente.telefono = telefono
    if correo and correo.strip():
        cliente.correo = correo
    if municipio and municipio.strip():
        cliente.municipio = municipio
    if codigo_postal and codigo_postal.strip():
        cliente.codigo_postal = codigo_postal
    if clasificacion and clasificacion.strip():
        cliente.clasificacion = clasificacion
    if vendedor_id and vendedor_id.strip():
        cliente.vendedor_id = vendedor_id
    if tipo_entrega and tipo_entrega.strip():
        cliente.tipo_entrega = tipo_entrega
    if latitud and latitud.strip():
        cliente.latitud = latitud
    if longitud and longitud.strip():
        cliente.longitud = longitud

    db_session.add(cliente)
    db_session.commit()

    flash('Cliente editado exitosamente.', 'success')
    return redirect(url_for('clientes'))

@app.get('/eliminar_cliente/<id>')
def eliminar_cliente(id):
  
    cliente = db_session.query(models.Cliente).get(id)
    
    if not cliente:
        flash("El cliente no existe.", "error")
        return redirect(url_for('clientes'))
    
    db_session.delete(cliente)
    db_session.commit()

    flash("Vendedor eliminado exitosamente.", "success")
    return redirect(url_for('vehiculos'))



@app.route('/vehiculos')
def vehiculos(): 
    vehiculos = db_session.query(models.Vehiculo)
    return render_template('/admin/vehiculos.html', vehiculos=vehiculos)

@app.route('/agregar_vehiculo', methods=['GET', 'POST'])
def agregar_vehiculo():
    if request.method == 'GET':
        return render_template('admin/vehiculos/agregar_vehiculo.html')

    
    modelo = request.form.get('modelo')
    placas = request.form.get('placas')
    ultimo_servicio = request.form.get('ultimo_servicio')
    prox_verifi = request.form.get('prox_verifi')
    ultima_tenencia = request.form.get('ultima_tenencia')

    
   
    nuevo_vehiculo = models.Vehiculo(
        modelo = modelo,
        placas = placas,
        ultimo_servicio = ultimo_servicio,
        prox_verifi = prox_verifi,
        ultima_tenencia = ultima_tenencia
    )

    db_session.add(nuevo_vehiculo)
    db_session.commit()

    flash('Vehículo agregado exitosamente.', 'success')
    return redirect(url_for('vehiculos'))


@app.route('/actualizar_vehiculo/<id>', methods=['GET', 'POST'])
def actualizar_vehiculo(id):
    vehiculo = db_session.query(models.Vehiculo).get(id) 

    if not vehiculo:
        flash("El vehiculo no existe.", "error")
        return redirect(url_for('vehiculos'))

    if request.method == 'GET':
        return render_template('admin/vehiculos/actualizar_vehiculo.html', vehiculo=vehiculo)

    
    modelo = request.form.get('modelo')
    placas = request.form.get('placas')
    ultimo_servicio = request.form.get('ultimo_servicio')
    prox_verfi = request.form.get('prox_verifi')
    ultima_tenencia = request.form.get('ultima_tenencia')


    
    if modelo and modelo.strip():
        vehiculo.modelo = modelo
    if placas and placas.strip():
        vehiculo.placas = placas
    if ultimo_servicio and ultimo_servicio.strip():
        vehiculo.ultimo_servicio = ultimo_servicio
    if prox_verfi and prox_verfi.strip():
        vehiculo.prox_verfi = prox_verfi
    if ultima_tenencia and ultima_tenencia.strip():
        vehiculo.ultima_tenencia = ultima_tenencia
  

    db_session.add(vehiculo)
    db_session.commit()

    flash('Vehiculo editado exitosamente.', 'success')
    return redirect(url_for('vehiculos'))


@app.get('/eliminar_vehiculo/<id>')
def eliminar_vehiculo(id):
  
    vehiculo = db_session.query(models.Vehiculo).get(id)
    
    if not vehiculo:
        flash("El vehiculo no existe.", "error")
        return redirect(url_for('vehiculos'))
    
    db_session.delete(vehiculo)
    db_session.commit()

    flash("Vendedor eliminado exitosamente.", "success")
    return redirect(url_for('vehiculos'))


@app.route('/costos')
def costos(): 
    costos = db_session.query(models.Costo)
    return render_template('/admin/costos.html', costos=costos)


@app.route('/agregar_costo', methods=['GET', 'POST'])
def agregar_costo():
    if request.method == 'GET':
        clientes = db_session.query(models.Cliente)
        return render_template('admin/costos/agregar_costo.html', clientes=clientes)

    
    prec_gasolina = request.form.get('prec_gasolina')
    prec_caseta = request.form.get('prec_caseta')
    lugar_salida = request.form.get('lugar_salida')
    lugar_llegada = request.form.get('lugar_llegada')
    distancia = request.form.get('distancia')
    tiempo = request.form.get('tiempo')
    total_costo = request.form.get('total_costo')
    cliente_id = request.form.get('cliente_id')

    
   
    nuevo_costo = models.Costo(
        prec_gasolina = prec_gasolina,
        prec_caseta = prec_caseta,
        lugar_salida = lugar_salida,
        lugar_llegada = lugar_llegada,
        distancia = distancia,
        tiempo = tiempo,
        total_costo = total_costo,
        cliente_id = cliente_id
    )

    db_session.add(nuevo_costo)
    db_session.commit()
   
    flash('Costo agregado exitosamente.', 'success')
    return redirect(url_for('costos'))



@app.route('/actualizar_costo/<id>', methods=['GET', 'POST'])
def actualizar_costo(id):
    costo = db_session.query(models.Costo).get(id) 

    if not costo:
        flash("El costo no existe.", "error")
        return redirect(url_for('vehiculos'))

    if request.method == 'GET':
        return render_template('admin/costos/actualizar_costo.html', costo=costo)

     
    prec_gasolina = request.form.get('prec_gasolina')
    prec_caseta = request.form.get('prec_caseta')
    lugar_salida = request.form.get('lugar_salida')
    lugar_llegada = request.form.get('lugar_llegada')
    distancia = request.form.get('distancia')
    tiempo = request.form.get('tiempo')
    total_costo = request.form.get('total_costo')
    cliente_id = request.form.get('cliente_id')



    
    if prec_gasolina and prec_gasolina.strip():
        costo.prec_gasolina = prec_gasolina
    if prec_caseta and prec_caseta.strip():
        costo.prec_caseta = prec_caseta
    if lugar_salida and lugar_salida.strip():
        costo.lugar_salida = lugar_salida
    if lugar_llegada and lugar_llegada.strip():
        costo.lugar_llegada = lugar_llegada
    if distancia and distancia.strip():
        costo.distancia = distancia
    if tiempo and tiempo.strip():
        costo.tiempo = tiempo
    if total_costo and total_costo.strip():
        costo.total_costo = total_costo
    if cliente_id and cliente_id.strip():
        costo.cliente_id = cliente_id
  

    db_session.add(costo)
    db_session.commit()

    flash('Vehiculo editado exitosamente.', 'success')
    return redirect(url_for('vehiculos'))

@app.get('/eliminar_costo/<id>')
def eliminar_costo(id):
  
    costo = db_session.query(models.Costo).get(id)
    
    if not costo:
        flash("El costo no existe.", "error")
        return redirect(url_for('costos'))
    
    db_session.delete(costo)
    db_session.commit()

    flash("Vendedor eliminado exitosamente.", "success")
    return redirect(url_for('costos'))



@app.route('/rutas')
def rutas(): 
    rutas = db_session.query(models.Ruta)
    return render_template('/admin/rutas.html', rutas=rutas)


@app.route('/registrar_rutas/', methods=['GET', 'POST'])
def registrar_ruta():
    if request.method == 'GET':
        return render_template('admin/rutas/registrar_rutas.html')

    
    num_ruta = request.form.get('num_ruta')
    grupo_rutas = request.form.get('grupo_rutas')
    ultimo_servicio = request.form.get('ultimo_servicio')
    prox_verifi = request.form.get('prox_verifi')
    ultima_tenencia = request.form.get('ultima_tenencia')

    
   
    nuevo_vehiculo = models.Vehiculo(
        num_ruta = num_ruta,
        grupo_rutas = grupo_rutas,
        ultimo_servicio = ultimo_servicio,
        prox_verifi = prox_verifi,
        ultima_tenencia = ultima_tenencia
    )

    db_session.add(nuevo_vehiculo)
    db_session.commit()

    flash('Vehículo agregado exitosamente.', 'success')
    return redirect(url_for('vehiculos'))





#----------------------------------------------FUNCIONES SUB ADMIN------------------------------------
@app.route('/sesion_subadmin')
def sub_sesion():
    pedidos = db_session.query(models.Pedido)
    return render_template('/sub_admin/sesion.html', pedidos=pedidos)


@app.route('/agregar_pedido', methods=['GET', 'POST'])
def agregar_pedido():
    repartidores = db_session.query(models.Repartidor)
    vehiculos = db_session.query(models.Vehiculo)
    costos = db_session.query(models.Costo)
    if request.method == 'GET':
        return render_template('sub_admin/pedidos/registrar_pedido.html', repartidores=repartidores, vehiculos=vehiculos, costos=costos)

    
    fecha = request.form.get('fecha')
    hora_inicio = request.form.get('hora_inicio')
    hora_fin = request.form.get('hora_fin')
    repartidor_id = request.form.get('repartidor_id')
    vehiculo_id = request.form.get('vehiculo_id')
    ruta_id = request.form.get('ruta_id')
    costo_id = request.form.get('costo_id')

   
    nuevo_repartidor = models.Pedido(
       fecha = fecha,
       hora_inicio = hora_inicio,
       hora_fin = hora_fin,
       repartidor_id = repartidor_id,
       vehiculo_id = vehiculo_id,
       ruta_id = ruta_id,
       costo_id = costo_id 
    )

    db_session.add(nuevo_repartidor)
    db_session.commit()

    flash('Pedido agregado exitosamente.', 'success')
    return redirect(url_for('sub_sesion'))

@app.route('/generar_pdf/<int:id_pedido>')
def generar_pdf(id_pedido):

    pedido = db_session.query(models.Pedido).get(id_pedido)

    html = render_template(
        'formato.html',
        no_pedido=pedido.id_pedido,
        fecha_pedido=pedido.fecha,
        hora_inicio=pedido.hora_inicio,
        hora_fin=pedido.hora_fin,
        repartidor=f"{pedido.repartidor.nombre} {pedido.repartidor.apellidos}",
        vehiculo=pedido.vehiculo.placas,
        ruta=pedido.ruta_id,
        costo_total=pedido.costo.total_costo,
    )


    pdf = HTML(string=html).write_pdf()


    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = f'attachment; filename=recibo_pedido_{id_pedido}.pdf'

    return response

if __name__ == '__main__':
    app.run('0.0.0.0', 8081, debug=True)