import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config/router/router.dart';
import 'package:frontend/utils/authorize.dart';

import 'config/theme/app_theme.dart';
import 'presentation/screens/screen.dart';

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
      builder: (context, child) => Overlay(
        key: LoadingScreen.overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) => child ?? const SizedBox.shrink(),
          ),
        ],
      ),
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 0, selectedTextStyle: 1).getTheme(),
      routerConfig: router,
    );
  }
}
