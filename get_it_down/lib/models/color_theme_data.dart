import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {

  bool _isGreen=true;
  bool get isGreen=>_isGreen;
  final ThemeData _greenThema = ThemeData(
    scaffoldBackgroundColor: Colors.green,
    primaryColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.green),
    appBarTheme: const AppBarTheme(
        color: Colors.green, titleTextStyle: TextStyle(fontSize: 35)),
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),

  );
  final ThemeData _redThema = ThemeData(
    scaffoldBackgroundColor: Colors.red,
    primaryColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(secondary: Colors.red),
    appBarTheme: const AppBarTheme(
        color: Colors.red, titleTextStyle: TextStyle(fontSize: 35)),
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );
  ThemeData _selectedThemData = ThemeData(
    scaffoldBackgroundColor: Colors.green,
    primaryColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.green),
    appBarTheme: const AppBarTheme(
        color: Colors.green, titleTextStyle: TextStyle(fontSize: 35)),
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );
  ThemeData get selectedThemaData => _isGreen ? _greenThema : _redThema;
  static SharedPreferences? _sharedPreferences;

  Future<void> creatrPrefObject()async{
    _sharedPreferences=await SharedPreferences.getInstance();
  }
  void getsaveThemeToSharedPref(bool value){
    _sharedPreferences?.setBool('ThemeData', value);
  }
  void loadThemeFromSharedPref(){
    _isGreen=_sharedPreferences?.getBool('ThemeData') ?? true;
    // ?? yani getden null değer gelirse _isgreen'e true değeri ata.
  }
  void switchTheme(bool selected) {
    _isGreen=selected;
    getsaveThemeToSharedPref(selected);
    notifyListeners();
  }


}
