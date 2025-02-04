import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DatosEmpresaScreen extends StatefulWidget {
  const DatosEmpresaScreen({super.key});

  @override
  State<DatosEmpresaScreen> createState() => _DatosEmpresaScreenState();
}

class _DatosEmpresaScreenState extends State<DatosEmpresaScreen> {
  final TextEditingController _nitController = TextEditingController();
  final TextEditingController _razonSocialController = TextEditingController();
  final TextEditingController _representanteController =
      TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _onAccept() {
    if (_nitController.text.trim().isEmpty ||
        _razonSocialController.text.trim().isEmpty ||
        _representanteController.text.trim().isEmpty ||
        _direccionController.text.trim().isEmpty ||
        _telefonoController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Agregar lógica para guardar los datos de la empresa.
    context.push('/nextScreen'); // Reemplazar con la ruta deseada.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Datos empresa',
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
                    _buildTextField(
                        'NIT', _nitController, TextInputType.number),
                    _buildTextField('Razón Social', _razonSocialController,
                        TextInputType.text),
                    _buildTextField('Representante Legal',
                        _representanteController, TextInputType.text),
                    _buildTextField('Dirección', _direccionController,
                        TextInputType.streetAddress),
                    _buildTextField(
                        'Teléfono', _telefonoController, TextInputType.phone),
                    _buildTextField(
                        'Email', _emailController, TextInputType.emailAddress),
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
    );
  }
}
