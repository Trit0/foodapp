import "package:flutter/material.dart";
import "package:foodapp/theme/text.theme.dart";

class AppTheme {
  static const _primary = Color(0xFFFFFF); // TODO: primary color
  static const _secondary = Color(0xFFFFFF); // TODO: secondary color
  static const _surface = Color(0xFF0000); // TODO: surface color

  static const lightShadow = [
    BoxShadow(
      offset: Offset(-2, 0),
      blurRadius: 8,
      color: Color(0x1F000000),
    ),
  ];

  static const shadow = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 8,
      color: Color(0x1F000000),
    ),
  ];

  const AppTheme._();

  static ThemeData generateTheme() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      // TODO: Implement colorScheme with proper color + surface
      colorScheme: const ColorScheme.dark(
        primary: _primary,
        onPrimary: Colors.white,
        secondary: _secondary,
        onSecondary: Colors.white,
        surface: _surface,
        onSurface: Colors.white,
        background: _primary,
        onBackground: Colors.white,
      ),
      visualDensity: const VisualDensity(vertical: -1, horizontal: -1),
      inputDecorationTheme: buildInputTheme(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _secondary,
        selectionHandleColor: _primary,
        selectionColor: _secondary.withOpacity(0.5),
      ),
      textButtonTheme: buildTextButtonTheme(),
      elevatedButtonTheme: buildElevatedButtonTheme(),
      outlinedButtonTheme: buildOutlinedButtonTheme(),
      textTheme: AppTextStyle.buildTextTheme(color: Colors.white),
      primaryTextTheme: AppTextStyle.buildTextTheme(color: Colors.white),
      accentTextTheme: AppTextStyle.buildTextTheme(color: _secondary),
      dividerTheme: DividerThemeData(
        color: _secondary.withOpacity(0.5),
        thickness: 1,
      ),
      scrollbarTheme: ScrollbarThemeData(trackVisibility: MaterialStateProperty.all(false)),
    );
  }

  static TextButtonThemeData buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _secondary,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(),
        minimumSize: Size.zero,
      ),
    );
  }

  static ElevatedButtonThemeData buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: _secondary,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(),
        minimumSize: Size.zero,
      ),
    );
  }

  static OutlinedButtonThemeData buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _secondary,
        side: const BorderSide(
          color: _secondary,
          width: 1,
        ),
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(),
        minimumSize: Size.zero,
      ),
    );
  }

  static InputDecorationTheme buildInputTheme() {
    const border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );

    return InputDecorationTheme(
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      contentPadding: const EdgeInsets.all(16),
      labelStyle: AppTextStyle.text(
        color: Colors.white.withOpacity(0.5),
      ),
      floatingLabelStyle: const AppTextStyle.label(color: Colors.white),
    );
  }
}
