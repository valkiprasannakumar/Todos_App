// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeType { Light, Dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  ThemeType _themeType;

  ThemeProvider(
    this._themeData,
    this._themeType,
  ) {
    _themeType = ThemeType.Dark;
    _themeData = _buildDarkTheme();
  }

  ThemeData get themeData => _themeData;
  ThemeType get themeType => _themeType;

  void toggleTheme() {
    _themeType =
        _themeType == ThemeType.Light ? ThemeType.Dark : ThemeType.Light;
    _themeData =
        _themeType == ThemeType.Light ? _buildLightTheme() : _buildDarkTheme();
    notifyListeners();
  }

  ThemeData _buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        toolbarTextStyle: TextStyle(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(secondary: Colors.blueAccent),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: const AppBarTheme(
        color: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        toolbarTextStyle: TextStyle(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.indigo,
      ).copyWith(secondary: Colors.indigoAccent),
    );
  }
}
