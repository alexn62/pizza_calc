import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charcode/charcode.dart' as char;

class GeneralServices extends ChangeNotifier {
  static SharedPreferences? _preferences;
  static const _keyDarkMode = 'darkmode';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  ThemeMode get themeMode =>
      getDarkMode() == true ? ThemeMode.dark : ThemeMode.light;

  Future setDarkMode(bool value) async {
    await _preferences!.setBool(_keyDarkMode, value);
    notifyListeners();
  }

  bool getDarkMode() => _preferences!.getBool(_keyDarkMode) ?? false;

  bool usaMode = false;
  void setUsaMode(bool val) {
    usaMode = val;
    notifyListeners();
  }

  PizzaSize size = PizzaSize.Medium;

  setSize(PizzaSize newSize) {
    size = newSize;
    notifyListeners();
  }

  double get sizeConversion {
    switch (size) {
      case PizzaSize.Medium:
        {
          return 1;
        }
      case PizzaSize.Small:
        {
          return 2 / 3;
        }
      case PizzaSize.Large:
        {
          return 1.5;
        }
    }
  }

  int amount = 1;
  void increaseAmount() {
    if (amount > 99) {
      return;
    }
    amount++;
    notifyListeners();
  }

  void decreaseAmount() {
    if (amount < 1) {
      return;
    }
    amount--;
    notifyListeners();
  }

  String fraction(int? frac) {
    switch (frac) {
      case 0:
        return '';
      case 25:
        return '¼';
      case 5:
        return '½';
      case 75:
        return '¾';
      default:
        return '';
    }
  }


  // flour
  static const int FLOUR_PER_SERVING_GRAMS = 200;
  static const double FLOUR_PER_SERVING_CUPS = 1.25;

  String get flour {
    if (usaMode) {
      print(sizeConversion);
      double am = ((FLOUR_PER_SERVING_CUPS * amount * sizeConversion) / 0.25).round() *0.25;
      print(am);
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' cups';
    }
    return (FLOUR_PER_SERVING_GRAMS * amount * sizeConversion)
            .toDouble()
            .toStringAsFixed(0) +
        ' g';
  }

  // water
  static const int WATER_PER_SERVING_MILLILITEERS = 120;
  static const double WATER_PER_SERVING_OZ = 4.3;

  String get water {
    if (usaMode){
      return (WATER_PER_SERVING_OZ * amount * sizeConversion).toStringAsFixed(1) + ' oz';
    }
    return (WATER_PER_SERVING_MILLILITEERS * amount).toStringAsFixed(0) + ' ml';
  }
}

enum PizzaSize { Small, Medium, Large }
