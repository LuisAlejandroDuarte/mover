import 'package:flutter/material.dart';

class LoadingScreen {
  static final GlobalKey<OverlayState> _overlayKey = GlobalKey<OverlayState>();
  static OverlayEntry? _currentOverlay;

  static GlobalKey<OverlayState> get overlayKey => _overlayKey;

  static void show(BuildContext context) {
    if (_currentOverlay != null) return;

    _currentOverlay = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black54,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );

    _overlayKey.currentState?.insert(_currentOverlay!);
  }

  static void hide() {
    if (_currentOverlay != null) {
      _currentOverlay!.remove(); // Elimina el overlay de la pantalla
      _currentOverlay = null; // Limpia la referencia
    }
  }
}
