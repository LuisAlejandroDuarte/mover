import 'package:flutter/material.dart';

class AddOfertScreen extends StatelessWidget {
  const AddOfertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear Oferta',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Container(),
    );
  }
}
