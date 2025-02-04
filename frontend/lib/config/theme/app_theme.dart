import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorList = <Color>[
  Color.fromARGB(255, 8, 134, 236),
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.cyan,
  Colors.pink,
  Colors.pinkAccent,
  Colors.black,
  Color.fromARGB(255, 130, 202, 226)
];

// Define styles using Google Fonts
final textStyleList = <TextStyle>[
  GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.normal),
  GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal),
  GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
  GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w500),
  GoogleFonts.oswald(fontSize: 22, fontWeight: FontWeight.w700),
  GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w900),
  GoogleFonts.raleway(fontSize: 26, fontWeight: FontWeight.w600),
  GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w800),
  GoogleFonts.merriweather(fontSize: 30, fontWeight: FontWeight.bold),
  // Add more text styles as needed
];

class AppTheme {
  final int selectedColor;
  final int selectedTextStyle;

  AppTheme({this.selectedColor = 0, this.selectedTextStyle = 0})
      : assert(selectedColor >= 0, "Selected color must be greater than 0"),
        assert(selectedColor < colorList.length,
            "Selected color must be less or equal than ${colorList.length - 1}"),
        assert(selectedTextStyle >= 0,
            "Selected text style must be greater than 0"),
        assert(selectedTextStyle < textStyleList.length,
            "Selected text style must be less or equal than ${textStyleList.length - 1}");

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorList[selectedColor],
        ).copyWith(
          primary: colorList[
              selectedColor], // Asegúrate de que el color primario sea el esperado
        ),
        textTheme: TextTheme(
          // Labels
          labelLarge: textStyleList[selectedTextStyle].copyWith(
            fontSize: 18, // Más pequeño que title
            fontWeight: FontWeight.normal, // Peso normal para label
            color: Colors.grey[800], // Color menos destacado
          ),
          labelMedium: textStyleList[selectedTextStyle].copyWith(
            fontSize: 16, // Aún más pequeño
            fontWeight: FontWeight.normal,
            color: Colors.grey[600],
          ),
          labelSmall: textStyleList[selectedTextStyle].copyWith(
            fontSize: 14, // El más pequeño
            fontWeight: FontWeight.w300, // Peso más ligero para menor énfasis
            color: Colors.grey[500],
          ),

          // Titles
          titleLarge: textStyleList[selectedTextStyle].copyWith(
            fontSize: 24, // Más grande que los labels
            fontWeight: FontWeight.bold, // Peso más fuerte para destacar
            color: Colors.black, // Color fuerte
          ),
          titleMedium: textStyleList[selectedTextStyle].copyWith(
            fontSize: 20, // Tamaño intermedio
            fontWeight: FontWeight.w600, // Peso medio-alto
            color: Colors.black87, // Un tono menos fuerte que titleLarge
          ),
          titleSmall: textStyleList[selectedTextStyle].copyWith(
            fontSize: 18, // Aún más pequeño pero más grande que los labels
            fontWeight: FontWeight.w500, // Peso medio
            color: Colors.black54, // Tono grisáceo
          ),

          // Customize other text styles if needed
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
