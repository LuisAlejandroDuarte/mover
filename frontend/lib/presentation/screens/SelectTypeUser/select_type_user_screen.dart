import 'package:flutter/material.dart';
import 'package:frontend/domain/domain.dart';

import 'package:go_router/go_router.dart';

import '../../../utils/storage/storagex.dart';

class SelectTypeUserScreen extends StatefulWidget {
  const SelectTypeUserScreen({super.key});

  @override
  State<SelectTypeUserScreen> createState() => _SelectTypeUserState();
}

class _SelectTypeUserState extends State<SelectTypeUserScreen> {
  bool? isSelected;
  User? user = User();
  UserStorage userStorage = UserStorage();

  Future<void> loadUSer() async {
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
    loadUSer();
  }

  Future<void> selectedTipoUSer(int tipo) async {
    User? updateUser = user!.copyWith(tipoUserId: tipo);

    await userStorage.save(updateUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Seleccione tipo de usuario',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/typeNaturaleza');
                selectedTipoUSer(2);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: user!.tipoUserId == 2
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: const Text(
                'Cliente',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                context.push('/typeTransportador');
                selectedTipoUSer(3);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: user!.tipoUserId == 3
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: const Text(
                'Transportador',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
