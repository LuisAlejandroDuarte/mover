import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddVehiclePhotoScreen extends StatefulWidget {
  const AddVehiclePhotoScreen({super.key});

  @override
  AddVehiclePhotoScreenState createState() => AddVehiclePhotoScreenState();
}

class AddVehiclePhotoScreenState extends State<AddVehiclePhotoScreen> {
  final List<File> _images =
      []; // Lista para almacenar las imágenes seleccionadas o tomadas.
  final ImagePicker _picker = ImagePicker();

  // Método para seleccionar una imagen de la galería
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path)); // Agregar la imagen a la lista.
      });
    }
  }

  // Método para tomar una foto con la cámara
  Future<void> _takePhotoWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path)); // Agregar la imagen a la lista.
      });
    }
  }

  // Método para mostrar la imagen en un diálogo a pantalla completa con zoom
  void _showImageDetail(File image) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Hacer el fondo transparente
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: InteractiveViewer(
              panEnabled: true, // Permitir mover la imagen
              boundaryMargin: const EdgeInsets.all(0), // Sin márgenes
              minScale: 0.1, // Escala mínima
              maxScale: 4.0, // Escala máxima
              child: Image.file(image,
                  fit: BoxFit.contain), // Mantener la proporción
            ),
          ),
        );
      },
    );
  }

  // Método para eliminar una imagen de la lista
  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index); // Eliminar la imagen en el índice especificado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Fotos del Vehículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botones para tomar o seleccionar foto
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImageFromGallery,
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Seleccionar Foto'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _takePhotoWithCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Tomar Foto'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Mostrar todas las imágenes seleccionadas o tomadas
            Expanded(
              child: _images.isEmpty
                  ? const Center(child: Text('No se han agregado fotos.'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            3, // Cambia esto según la cantidad de columnas
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showImageDetail(_images[
                                    index]); // Mostrar la imagen en detalle
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Bordes redondeados
                                child: Image.file(
                                  _images[index],
                                  fit: BoxFit.cover, // Mantener la proporción
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                onPressed: () {
                                  _removeImage(
                                      index); // Llamar al método para eliminar la imagen
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            // Botón de aceptar al final
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para cuando se presione "Aceptar".
                // Por ejemplo, enviar las imágenes seleccionadas a otra pantalla o guardarlas.
                Navigator.pop(context, _images); // Esto es solo un ejemplo.
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}
