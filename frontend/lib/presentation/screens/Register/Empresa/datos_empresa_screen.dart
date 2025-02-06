import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/domain/domain.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/storage/storagex.dart';
import '../../../providers/providers.dart';

class DatosEmpresaScreen extends ConsumerStatefulWidget {
  const DatosEmpresaScreen({super.key});

  @override
  ConsumerState<DatosEmpresaScreen> createState() => _DatosEmpresaScreenState();
}

class _DatosEmpresaScreenState extends ConsumerState<DatosEmpresaScreen> {
  User? user;
  EmpresaStorage empresaStorage = EmpresaStorage();
  UserStorage userStorage = UserStorage();
  final TextEditingController _nitController = TextEditingController();
  final TextEditingController _razonSocialController = TextEditingController();
  final TextEditingController _representanteController =
      TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _onAccept() async {
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

    setState(() => _isLoading = true);

    user = await userStorage.get();
    if (user == null) {
      setState(() => _isLoading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al obtener usuario.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Empresa nuevaEmpresa = Empresa(
        nit: _nitController.text,
        razonSocial: _razonSocialController.text,
        representanteLegal: _representanteController.text,
        direccion: _direccionController.text,
        email: _emailController.text,
        telefono: _telefonoController.text,
        userId: user!.id);

    User updatedUser = user!.copyWith(empresa: nuevaEmpresa);
    await userStorage.save(updatedUser);

    if (updatedUser.id != 0) {
      await saveEmpresa();
      if (mounted) {
        setState(() => _isLoading = false);
        if (user!.tipoUserId == 2) {
          context.pushReplacement('/listOfertas');
        } else if (user!.tipoUserId == 3) {
          context.pushReplacement('/listServicios');
        }
      }
    } else {
      if (mounted) {
        setState(() => _isLoading = false);
        context.push('/credencialempresa');
      }
    }
  }

  Future<void> saveEmpresa() async {
    try {
      user = await userStorage.get();
      // ignore: unnecessary_null_comparison
      if (user == null || user!.empresa == null) {
        setState(() => _isLoading = false);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No hay información de empresa para guardar.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final empresaRepository = ref.read(empresaRepositoryProvider);
      Empresa? nuevaEmpresa =
          await empresaRepository.crearEmpresa(user!.empresa);

      // ignore: unnecessary_null_comparison
      if (nuevaEmpresa == null) {
        setState(() => _isLoading = false);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al guardar la empresa.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      User userUpdated = user!.copyWith(empresa: nuevaEmpresa);
      await userStorage.save(userUpdated);
    } catch (e) {
      setState(() => _isLoading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField('NIT', _nitController, TextInputType.number),
            _buildTextField(
                'Razón Social', _razonSocialController, TextInputType.text),
            _buildTextField('Representante Legal', _representanteController,
                TextInputType.text),
            _buildTextField(
                'Dirección', _direccionController, TextInputType.streetAddress),
            _buildTextField(
                'Teléfono', _telefonoController, TextInputType.phone),
            _buildTextField(
                'Email', _emailController, TextInputType.emailAddress),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _onAccept,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Aceptar',
                      style: TextStyle(fontSize: 20),
                    ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
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
}
