import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/domain.dart';
import '../../../../utils/storage/storagex.dart';

class AddVehiclePhotoScreen extends StatefulWidget {
  final Function() onAddVehiclePhotoSelected;
  const AddVehiclePhotoScreen(
      {required this.onAddVehiclePhotoSelected, super.key});

  @override
  AddVehiclePhotoScreenState createState() => AddVehiclePhotoScreenState();
}

class AddVehiclePhotoScreenState extends State<AddVehiclePhotoScreen> {
  final List<MultimediaVehiculo> _images =
      []; // Lista de objetos MultimediaVehiculo.
  final ImagePicker _picker = ImagePicker();
  final MultimediaVehiculoListStorage _storage =
      MultimediaVehiculoListStorage();
  final VehiculoStorage vehiculoStorage = VehiculoStorage();
  Vehiculo? vehiculo;
  VehiculoListStorage vehiculoListStorage = VehiculoListStorage();
  List<Vehiculo?>? listVehiculo;
  @override
  void initState() {
    super.initState();
    _loadStoredImages(); // Cargar imágenes almacenadas al iniciar.
  }

  Future<void> _loadStoredImages() async {
    final storedImages = await _storage.getList();
    vehiculo = await vehiculoStorage.get();

    listVehiculo = await vehiculoListStorage.getList();

    int index =
        listVehiculo?.indexWhere((element) => element?.id == vehiculo?.id) ??
            -1;

    Vehiculo updatedVehiculo = vehiculo?.copyWith(
          multimediaVehiculo: storedImages,
        ) ??
        Vehiculo(
          multimediaVehiculo: storedImages,
        );

    await vehiculoStorage.save(updatedVehiculo);

    if (index >= 0) {
      listVehiculo![index] = updatedVehiculo;
      await vehiculoListStorage.saveList(listVehiculo!);
    }

    if (mounted) {
      setState(() {
        _images.clear();
        _images.addAll(storedImages.whereType<MultimediaVehiculo>());
      });
    }
  }

  Future<void> _saveImages() async {
    if (_images.isEmpty) {
      // Mostrar un mensaje indicando que no hay imágenes
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No hay imágenes para guardar'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      await _storage.saveList(_images);
      _loadStoredImages();
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final newImage = MultimediaVehiculo(link: pickedFile.path);
      setState(() {
        _images.add(newImage);
      });
      await _saveImages();
    }
  }

  Future<void> _takePhotoWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final newImage = MultimediaVehiculo(link: pickedFile.path);
      setState(() {
        _images.add(newImage);
      });

      await _saveImages();
    }
  }

  void _removeImage(int index) async {
    setState(() {
      _images.removeAt(index);
    });
    await _saveImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar Fotos del Vehículo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.pushReplacement('/mainoferta', extra: {'initialIndex': 1});
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImageFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text('Galería'),
              ),
              ElevatedButton.icon(
                onPressed: _takePhotoWithCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Cámara'),
              ),
            ],
          ),
          Expanded(
            child: _images.isEmpty
                ? const Center(child: Text('No se han agregado fotos.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _showImageDetail(_images[index].link);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  File(_images[index].link),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _removeImage(index);
                            },
                          ),
                        ],
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Espacio alrededor del botón
            child: ElevatedButton(
              onPressed: () {
                // Lógica para el botón Aceptar
                _saveImages();
                if (_images.isEmpty == false) {
                  widget.onAddVehiclePhotoSelected();
                }
              },
              child: const Text('Aceptar'),
            ),
          ),
        ],
      ),
    );
  }

  void _showImageDetail(String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 10,
          child: InteractiveViewer(
            child: Image.file(File(imagePath), fit: BoxFit.contain),
          ),
        );
      },
    );
  }
}
