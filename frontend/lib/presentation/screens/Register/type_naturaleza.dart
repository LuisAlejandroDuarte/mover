import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/domain/domain.dart';
import '../../../utils/storage/storagex.dart';

class TypeNaturaleza extends StatefulWidget {
  const TypeNaturaleza({super.key});

  @override
  State<TypeNaturaleza> createState() => _TypeNaturalezaState();
}

class _TypeNaturalezaState extends State<TypeNaturaleza> {
  User? user;
  UserStorage userStorage = UserStorage();

  Future<void> cargarDatos() async {
    User? loadedUser = await userStorage.get();
    if (mounted) {
      setState(() {
        user = loadedUser;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> selectedTipoNaturaleza(int? tipo) async {
    if (user == null) return;
    User updateUser = user!.copyWith(tipoNaturaleza: tipo);
    await userStorage.save(updateUser);
    setState(() {
      user = updateUser;
    });
  }

  void navigateBack() {
    context.pushReplacement('/selecttypeuser');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (_) => navigateBack(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Seleccione tipo naturaleza',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: navigateBack,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectedTipoNaturaleza(TipoNaturaleza.persona.value);

                  context.push('/datospersonanatural');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color:
                          (user?.tipoNaturaleza == TipoNaturaleza.persona.value)
                              ? Colors.grey.shade300
                              : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Persona',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  selectedTipoNaturaleza(TipoNaturaleza.empresa.value);
                  context.push('/datosempresa');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color:
                          (user?.tipoNaturaleza == TipoNaturaleza.empresa.value)
                              ? Colors.grey.shade300
                              : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Empresa',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
