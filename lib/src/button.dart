// Creado por: Uriel Maldonado Cortez
// Asignatura: Desarrollo Movil Integral
//Grado: 10   Grupo: "A"
// Docente: MTI. Marco Antonio Ramirez Hernandez
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Definición de la clase MyButton como StatefulWidget
class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

// Declaración de variables globales
String textButton = "Ara Ara"; // Texto inicial del botón
int index = 0; // Índice inicial de la colección de textos
List<String> collections = [
  "Ara Ara",
  "YameteKudasai",
  "Arigato"
]; // Lista de textos

// Definición de la clase _MyButtonState que extiende State<MyButton>
class _MyButtonState extends State<MyButton> {
  int currentIndex = 0; // Índice inicial para el carrusel de imágenes
  List<String> imagePaths = [
    "assets/2.png",
    "assets/3.png",
    "assets/6.png",
  ]; // Lista de rutas de imágenes

  // Método que se ejecuta al presionar el botón
  void onPressedButton() {
    setState(() {
      currentIndex = (currentIndex + 1) %
          imagePaths.length; // Cambiar imagen en el carrusel
    });
    textButton = collections[index]; // Actualizar el texto del botón
    index = index < collections.length - 1
        ? index + 1
        : 0; // Cambiar índice en la colección de textos
  }

  // Método que construye la interfaz de usuario de la aplicación
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarea5_200931"), // Título de la barra de navegación
      ),
      body: Container(
        color: Colors.black, // Fondo negro para el cuerpo de la aplicación
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              margin: EdgeInsets.all(50.0),
              padding: EdgeInsets.all(20.0),
              child: CarouselSlider.builder(
                itemCount:
                    imagePaths.length, // Número de elementos en el carrusel
                options: CarouselOptions(
                  viewportFraction: 1.0, // Muestra una sola imagen a la vez
                  enableInfiniteScroll:
                      false, // Deshabilita el desplazamiento infinito
                  onPageChanged: (index, reason) {
                    onPressedButton(); // Llama al método al cambiar de página en el carrusel
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    imagePaths[
                        index], // Carga la imagen desde la lista de rutas
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 30.0), // Espacio en blanco
            Image.asset(
              imagePaths[currentIndex], // Muestra la imagen actual del carrusel
              fit: BoxFit.cover,
              width: 200.0, // Ancho deseado para la imagen actual
              height: 200.0, // Altura deseada para la imagen actual
            ),
            Text(
              textButton, // Muestra el texto actual del botón
              style: TextStyle(fontSize: 35.0, color: Colors.white),
            ),
            ElevatedButton(
              onPressed:
                  onPressedButton, // Llama al método al presionar el botón
              child: Text("SIGUIENTE IMAGEN"), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
