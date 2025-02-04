import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypeTransporterScreen extends StatelessWidget {
  const TypeTransporterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (dipPop) async {
        context.pushReplacement('/selecttypeuser');
      },

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              context.pushReplacement('/selecttypeuser');
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push('/selecttypeconductor');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Propietario',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacement('/authconductor');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Conductor Autorizado',
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
