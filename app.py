# Ana Tania Medina Espinoza 
# taniiimedina@gmail.com

# El catalogo de libros esta en una base de datos llamada libreria.sql
# Ahi se encuentran algunos de los libros que se fueron agregando
# En la linea 16 de codigo de pone el nombre de usuario , contraseña y nombre de la BD

# recursos necesarios
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

#base de datoscon SQLALCHEMY
app=Flask(__name__)
#                                                      usuario  contraseña          nombre_BD
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://root:1111fmsladefer@localhost/libreria'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db=SQLAlchemy(app)
ma= Marshmallow(app)

#clase, que sera nuestra tabla en la DB
class Libros(db.Model):
    id= db.Column(db.Integer, primary_key=True)
    title= db.Column(db.String(70), unique=True)
    autor= db.Column(db.String(70), unique=True)
    editorial= db.Column(db.String(70), unique=True)
    anio_publicacion= db.Column(db.Integer, unique=True)

    #instanciamos 
    def __init__(self, title, autor, editorial, anio_publicacion): 
        self.title=title
        self.autor= autor
        self.editorial = editorial
        self.anio_publicacion = anio_publicacion

db.create_all()

class LibrosEsquema(ma.Schema):
    class Meta:
        fields=('id', 'title', 'autor', 'editorial', 'anio_publicacion')

libro_esquema = LibrosEsquema()
libros_esquema= LibrosEsquema(many=True)

#ruta de inicio
@app.route('/')
def home():
    return '<h1>Bienvenido al catálogo de libros</h1>'

#ruta para agregar libros
@app.route("/libros", methods=['POST'])
def agregarLibros():
    title= request.json['title']
    autor =request.json['autor']
    editorial = request.json['editorial']
    anio_publicacion = request.json['anio_publicacion']

    nuevo_libro = Libros(title, autor, editorial, anio_publicacion)
    db.session.add(nuevo_libro)
    db.session.commit()

    return libro_esquema.jsonify(nuevo_libro)

#ruta para ver todos libros
@app.route("/libros")
def obtenerLibros():
    todosLibros = Libros.query.all()
    resultado = libros_esquema.dump(todosLibros)
    return jsonify(resultado)

#ruta para ver un libro
@app.route("/libros/<id>")
def obtenerLibro(id):
    libro = Libros.query.get(id)
    return libro_esquema.jsonify(libro)

#ruta para actualizar
@app.route("/libros/<id>", methods=['PUT'])
def modificarLibro(id):
    libro = Libros.query.get(id)

    title = request.json['title']
    autor = request.json['autor']
    editorial = request.json['editorial']
    anio_publicacion =request.json['anio_publicacion']

    libro.title = title
    libro.autor = autor
    libro.editorial = editorial
    libro.anio_publicacion = anio_publicacion
    db.session.commit()
    return libro_esquema.jsonify(libro)

#ruta para eliminar un libro
@app.route("/libros/<id>", methods=['DELETE'])
def eliminarLibro(id):
    libro= Libros.query.get(id)

    db.session.delete(libro)
    db.session.commit()
    
    todosLibros = Libros.query.all()
    resultado = libros_esquema.dump(todosLibros)
    return jsonify(resultado)
#ciclar el servidor
if __name__ == "__main__":
    app.run(debug=True)
