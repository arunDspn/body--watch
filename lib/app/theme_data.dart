import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watcha_body/constants/theme.dart';

class AppThemeData {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      primary: Colors.blue,
      onPrimaryContainer: Colors.white,
      secondaryContainer: Colors.white,
      secondary: Colors.black54,
    ),
    fontFamily: GoogleFonts.inter(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.red,
      ),
      color: Colors.amber,
    ).fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(59, 176, 176, 176),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(59, 176, 176, 176),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      displayMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: Colors.black54,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    chipTheme: const ChipThemeData(
      checkmarkColor: Colors.white,
      backgroundColor: Colors.grey,
      selectedColor: kPrimaryColorInLight,
      deleteIconColor: Colors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      secondarySelectedColor: Colors.red,
      secondaryLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.red,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.grey.shade100,
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      backgroundColor: Colors.grey.shade700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        enableFeedback: true,
        // overlayColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.selected)) {
        //     return Colors.purple;
        //   } else if (states.contains(MaterialState.hovered)) {
        //     return Colors.purple;
        //   } else {
        //     return Colors.grey.shade500;
        //   }
        // }),
        // textStyle: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.selected)) {
        //       return const TextStyle(
        //         color: Colors.amber,
        //       );
        //     } else {
        //       return const TextStyle(
        //         color: Colors.yellow,
        //       );
        //     }
        //   },
        // ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      primary: Colors.blue,
      // used icons
      secondary: Colors.grey.shade400,
      secondaryContainer: Colors.grey.shade900,
      // onPrimaryContainer: const Color.fromARGB(255, 53, 53, 53),
      onPrimaryContainer: Colors.grey.shade900,
    ),
    fontFamily: GoogleFonts.inter(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      color: Colors.amber,
    ).fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(60, 170, 167, 167),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(60, 170, 167, 167),
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      displayMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        color: Colors.white60,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: Colors.white60,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      textStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    canvasColor: Colors.black87,
    chipTheme: const ChipThemeData(
      checkmarkColor: Colors.white,
      backgroundColor: Colors.black26,
      selectedColor: kPrimaryColorInDark,
      deleteIconColor: Colors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.grey.shade900,
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      backgroundColor: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(BorderSide(color: Colors.white)),
        enableFeedback: true,
        // overlayColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     print(states);
        //     if (states.contains(MaterialState.selected)) {
        //       return Colors.purple;
        //     } else if (states.contains(MaterialState.focused)) {
        //       return Colors.red;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.amber;
        //     } else {
        //       return Colors.grey.shade500;
        //     }
        //   },
        // ),
        // textStyle: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.selected)) {
        //       return TextStyle(
        //         color: Colors.white,
        //       );
        //     } else {
        //       return TextStyle(
        //         color: Colors.yellow,
        //       );
        //     }
        //   },
        // ),
      ),
    ),
  );
}
