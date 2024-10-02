import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/presentation/screens/Transportista/transportista_screen.dart';

class SelectTypeUser extends StatelessWidget {
  const SelectTypeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/listOfertas');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransportistaScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Transportista',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
