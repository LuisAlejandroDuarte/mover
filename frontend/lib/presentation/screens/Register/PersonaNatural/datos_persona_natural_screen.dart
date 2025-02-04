import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class DatosPersonaNaturalScreen extends ConsumerStatefulWidget {
  const DatosPersonaNaturalScreen({super.key});

  @override
  ConsumerState<DatosPersonaNaturalScreen> createState() =>
      _DatosPersonaNaturalScreenState();
}

class _DatosPersonaNaturalScreenState
    extends ConsumerState<DatosPersonaNaturalScreen> {
  User? user;
  PersonaNatural? personaNatural;
  final UserStorage userStorage = UserStorage();
  final PersonaNaturalStorage personaNaturalStorage = PersonaNaturalStorage();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _identificacionController =
      TextEditingController();

  // Variable para almacenar el tipo de identificación seleccionado
  TipoIdentificacion? _selectedTipoIdentificacion;

  Future<void> cargarDatos() async {
    User? loadedUser = await userStorage.get();
    if (mounted) {
      setState(() {
        user = loadedUser;
        personaNatural = loadedUser?.personaNatural;

        // Si existe la persona natural, asignar los valores a los controladores.
        if (personaNatural != null) {
          _nombreController.text = personaNatural!.nombre;
          _apellidoController.text = personaNatural!.apellido;
          _direccionController.text = personaNatural!.direccion;
          _telefonoController.text = personaNatural!.telefono;
          _emailController.text = personaNatural!.email;
          _identificacionController.text = personaNatural!.identificacion;

          // Intentar asignar el tipo de identificación
          // Se utiliza ref.read para obtener la lista actual de tipos
          final tipos = ref.read(listTipoIdentificacionProvider);
          if (personaNatural!.tipoIdentificacionId != null) {
            try {
              _selectedTipoIdentificacion = tipos.firstWhere(
                (tipo) => tipo.id == personaNatural!.tipoIdentificacionId,
              );
            } catch (e) {
              _selectedTipoIdentificacion = null;
            }
          }
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Inicializa el provider para cargar los tipos de identificación
    Future.microtask(() {
      ref
          .read(listTipoIdentificacionProvider.notifier)
          .fetchTiposIdentificacion();
    });
    cargarDatos();
  }

  void _onAccept() async {
    if (_nombreController.text.trim().isEmpty ||
        _apellidoController.text.trim().isEmpty ||
        _direccionController.text.trim().isEmpty ||
        _telefonoController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _selectedTipoIdentificacion == null ||
        _identificacionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    PersonaNatural personanew = PersonaNatural(
        apellido: _apellidoController.text,
        direccion: _direccionController.text,
        email: _emailController.text,
        identificacion: _identificacionController.text,
        nombre: _nombreController.text,
        telefono: _telefonoController.text,
        tipoIdentificacionId: _selectedTipoIdentificacion!.id);

    User updateUser = user!.copyWith(personaNatural: personanew);
    await userStorage.save(updateUser);

    // Aquí se puede agregar la lógica para guardar o actualizar la información
    // Por ejemplo, actualizar el objeto personaNatural y luego guardarlo en storage

    // Navegación a la siguiente pantalla
    // ignore: use_build_context_synchronously
    context.push('/credencialpersona');
  }

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  void navigateBack() {
    context.pushReplacement('/typeNaturaleza');
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos la lista de tipos de identificación desde el provider.
    // Se asume que este provider retorna List<TipoIdentificacion>.
    final tiposIdentificacionList = ref.watch(listTipoIdentificacionProvider);

    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (_) => navigateBack(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Datos básicos',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Dropdown para seleccionar el tipo de identificación
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: DropdownButtonFormField<TipoIdentificacion>(
                          value: _selectedTipoIdentificacion,
                          decoration: const InputDecoration(
                            labelText: 'Tipo de Identificación',
                            labelStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          items: tiposIdentificacionList
                              .map((TipoIdentificacion tipo) {
                            return DropdownMenuItem<TipoIdentificacion>(
                              value: tipo,
                              child: Text(tipo.nombre),
                            );
                          }).toList(),
                          onChanged: (TipoIdentificacion? value) {
                            setState(() {
                              _selectedTipoIdentificacion = value;
                            });
                          },
                        ),
                      ),
                      _buildTextField('Identificación',
                          _identificacionController, TextInputType.text),
                      _buildTextField(
                          'Nombres', _nombreController, TextInputType.text),
                      _buildTextField(
                          'Apellidos', _apellidoController, TextInputType.text),
                      _buildTextField('Dirección', _direccionController,
                          TextInputType.streetAddress),
                      _buildTextField(
                          'Teléfono', _telefonoController, TextInputType.phone),
                      _buildTextField('Email', _emailController,
                          TextInputType.emailAddress),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _onAccept,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.6, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
