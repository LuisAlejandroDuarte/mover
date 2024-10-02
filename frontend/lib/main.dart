import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config/router/router.dart';
import 'package:frontend/utils/authorize.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  final authorize = Authorize();

  await authorize.fetchAndStoreToken();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 0, selectedTextStyle: 0).getTheme(),
      routerConfig: router,
    );
  }
}
