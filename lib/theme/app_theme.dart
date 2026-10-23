import 'package:flutter/material.dart';

/// Centralised professional theme for the DriveNow app.
///
/// Consistent colour palette, typography and component styling across every screen.
class AppTheme {
  AppTheme._();

  /// Brand primary ï¿½ deep navy (trust, professionalism)
  static const Color primary = Color(0xFF16213E);

  /// Brand secondary ï¿½ warm amber (action, highlights)
  static const Color secondary = Color(0xFFFCA311);

  /// Background / surface ï¿½ light grey-blue
  static const Color background = Color(0xFFF4F6F8);

  /// White surface for cards
  static const Color surface = Color(0xFFFFFFFF);

  /// Muted text colour
  static const Color textMuted = Color(0xFF6C757D);

  /// Dark text colour
  static const Color textDark = Color(0xFF1F2A44);

  /// Divider colour
  static const Color divider = Color(0xFFEEEEEE);

  /// Error colour
  static const Color error = Color(0xFFE53935);

  /// Success colour
  static const Color success = Color(0xFF28A745);

  /// Light theme
  static ThemeData get lightTheme {
    final ColorScheme colorScheme = const ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: surface,
      background: background,
      error: error,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: textDark,
      onBackground: textDark,
      onError: Colors.white,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: const BorderSide(color: primary, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error),
        ),
        labelStyle: const TextStyle(color: textMuted, fontSize: 14),
        hintStyle: const TextStyle(color: textMuted, fontSize: 14),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
        color: surface,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: textDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: textDark,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: textDark),
        bodyMedium: TextStyle(fontSize: 14, color: textMuted),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textDark,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: divider,
        thickness: 1,
        space: 1,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        dense: false,
      ),
    );
  }

  /// Returns a responsive cross-axis count based on screen width.
  static int responsiveCrossAxisCount(double width) {
    if (width >= 1200) return 4;
    if (width >= 768) return 3;
    if (width >= 600) return 2;
    return 2;
  }

  /// Returns a responsive child aspect ratio for car cards.
  static double responsiveChildAspectRatio(double width) {
    if (width >= 1200) return 0.85;
    if (width >= 768) return 0.82;
    if (width >= 600) return 0.80;
    return 0.75;
  }
}
