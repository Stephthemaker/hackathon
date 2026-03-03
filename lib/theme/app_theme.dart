import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Official Stellenbosch University brand colors
  static const Color maroon = Color(0xFF61223B); // SU Confident Maroon
  static const Color maroonDark = Color(0xFF4C1A2E);
  static const Color maroonLight = Color(0xFF8B3155);
  static const Color gold = Color(0xFFB79962); // SU Brilliant Gold
  static const Color goldLight = Color(0xFFD4B785);
  static const Color background = Color(0xFFF5F4F2);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textMuted = Color(0xFF6B6B6B);
  static const Color divider = Color(0xFFE5E0D8);
  static const Color darkBg = Color(0xFF141418);
  static final TextStyle uiControlText = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static ThemeData get lightTheme {
    final base = GoogleFonts.openSansTextTheme();
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: maroon,
        primary: maroon,
        secondary: gold,
        surface: surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textDark,
      ),
      scaffoldBackgroundColor: background,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: maroon,
        selectionColor: gold.withValues(alpha: 0.4),
        selectionHandleColor: maroon,
      ),
      textTheme: base.copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 64,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.1,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: textDark,
          height: 1.15,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: textDark,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: textDark,
          height: 1.25,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: textDark,
          height: 1.3,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleMedium: GoogleFonts.playfairDisplay(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textDark,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textDark,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textMuted,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: textDark,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: divider, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: maroon,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          textStyle: uiControlText,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: maroon,
          side: const BorderSide(color: maroon, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          textStyle: uiControlText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textMuted,
        ),
        hintStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textMuted,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: maroon, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: background,
        selectedColor: maroon,
        labelStyle: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        side: const BorderSide(color: divider),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  // ── Dark theme ──────────────────────────────────────────────────────
  static const Color darkSurface = Color(0xFF1C1C24);
  static const Color darkCard = Color(0xFF252530);
  static const Color darkText = Color(0xFFE4E4E4);
  static const Color darkMuted = Color(0xFF9E9E9E);

  static ThemeData get darkTheme {
    final base = GoogleFonts.openSansTextTheme(ThemeData.dark().textTheme);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: maroon,
        brightness: Brightness.dark,
        primary: maroonLight,
        secondary: gold,
        surface: darkSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkText,
      ),
      scaffoldBackgroundColor: darkBg,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: gold,
        selectionColor: gold.withValues(alpha: 0.4),
        selectionHandleColor: gold,
      ),
      textTheme: base.copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 64,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.1,
          letterSpacing: -1,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: darkText,
          height: 1.15,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: darkText,
          height: 1.2,
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: darkText,
          height: 1.25,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: darkText,
          height: 1.3,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: darkText,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkText,
        ),
        titleMedium: GoogleFonts.playfairDisplay(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: darkText,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkText,
          height: 1.7,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkMuted,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: darkText,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: maroon,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: darkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.white.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: maroon,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          textStyle: uiControlText,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: goldLight,
          side: const BorderSide(color: goldLight, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          textStyle: uiControlText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkCard,
        labelStyle: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: darkMuted,
        ),
        hintStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkMuted,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: gold, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: darkCard,
        selectedColor: maroon,
        labelStyle: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  // ── High-contrast light theme ───────────────────────────────────────
  static ThemeData get highContrastLightTheme {
    final base = lightTheme;
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        onSurface: Colors.black,
        onSurfaceVariant: const Color(0xFF1A1A1A),
        outline: Colors.black54,
      ),
      scaffoldBackgroundColor: const Color(0xFFF0F0F0),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      dividerTheme: const DividerThemeData(color: Colors.black26),
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  // ── High-contrast dark theme ────────────────────────────────────────
  static ThemeData get highContrastDarkTheme {
    final base = darkTheme;
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        onSurface: Colors.white,
        onSurfaceVariant: const Color(0xFFE0E0E0),
        outline: Colors.white54,
        surface: const Color(0xFF1A1A22),
      ),
      scaffoldBackgroundColor: const Color(0xFF0F0F14),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Colors.white30),
      iconTheme: const IconThemeData(color: Colors.white),
      cardTheme: CardThemeData(
        elevation: 0,
        color: const Color(0xFF222230),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.white24, width: 1),
        ),
      ),
    );
  }
}
