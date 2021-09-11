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
      double am =
          ((FLOUR_PER_SERVING_CUPS * amount * sizeConversion) / 0.25).round() *
              0.25;
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
    if (usaMode) {
      return (WATER_PER_SERVING_OZ * amount * sizeConversion)
              .toStringAsFixed(1) +
          ' oz';
    }
    return (WATER_PER_SERVING_MILLILITEERS * amount).toStringAsFixed(0) + ' ml';
  }

  // yeast
  static const double YEAST_PER_SERVING_GRAMS = 2.3;
  static const double YEAST_PER_SERVING_TSP = 0.75;

  String get yeast {
    if (usaMode) {
      double am =
          ((YEAST_PER_SERVING_TSP * amount * sizeConversion) / 0.25).round() *
              0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' tsp';
    }
    return (YEAST_PER_SERVING_GRAMS * amount * sizeConversion)
            .toStringAsFixed(0) +
        ' g';
  }

  // salt
  static const int SALT_PER_SERVING_GRAMS = 6;
  static const double SALT_PER_SERVING_TSP = 1.3;

  String get salt {
    if (usaMode) {
      double am =
          ((SALT_PER_SERVING_TSP * amount * sizeConversion) / 0.25).round() *
              0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' tsp';
    }
    return (SALT_PER_SERVING_GRAMS * amount * sizeConversion)
            .toStringAsFixed(0) +
        ' g';
  }

  // sauce salt
  static const int SAUCE_SALT_PER_SERVING_GRAMS = 3;
  static const double SAUCE_SALT_PER_SERVING_TSP = 0.5;

  String get sauce_salt {
    if (usaMode) {
      double am =
          ((SAUCE_SALT_PER_SERVING_TSP * amount * sizeConversion) / 0.25)
                  .round() *
              0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' tsp';
    }
    return (SAUCE_SALT_PER_SERVING_GRAMS * amount * sizeConversion)
            .toStringAsFixed(0) +
        ' g';
  }

  // tomatoes
  static const int TOMATOES_PER_SERVING_GRAMS = 250;
  static const double TOMATOES_PER_SERVING_CUPS = 1;

  String get tomatoes {
    if (usaMode) {
      double am = ((TOMATOES_PER_SERVING_CUPS * amount * sizeConversion) / 0.25)
              .round() *
          0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' cups';
    }
    return (TOMATOES_PER_SERVING_GRAMS * amount * sizeConversion)
            .toDouble()
            .toStringAsFixed(0) +
        ' g';
  }

  // basil
  static const int BASIL_LEAVES_PER_SERVING = 2;

  String get basil {
    return (BASIL_LEAVES_PER_SERVING * amount * sizeConversion)
        .toStringAsFixed(0) + ' leaves';
  }

  // olive oil
  static const int OLIVE_OIL_PER_SERVING_ML = 5;
  static const int OLIVE_OIL_PER_SERVING_TSP = 1;

  String get olive_oil {
    if (usaMode) {
      double am = ((OLIVE_OIL_PER_SERVING_TSP * amount * sizeConversion) / 0.25)
              .round() *
          0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' tsp';
    }
    return (OLIVE_OIL_PER_SERVING_ML * amount * sizeConversion)
            .toStringAsFixed(0) +
        ' ml';
  }

  // pepper
  static const int SAUCE_PEPPER_PER_SERVING_GRAMS = 3;
  static const double SAUCE_PEPPER_PER_SERVING_TSP = 0.5;

  String get pepper {
    if (usaMode) {
      double am =
          ((SAUCE_PEPPER_PER_SERVING_TSP * amount * sizeConversion) / 0.25)
                  .round() *
              0.25;
      int? frac = int.tryParse(am.toString().split('.')[1]);
      return am.floor().toString() + fraction(frac) + ' tsp';
    }
    return (SAUCE_PEPPER_PER_SERVING_GRAMS * amount * sizeConversion)
            .toStringAsFixed(0) +
        ' g';
  }
}

enum PizzaSize { Small, Medium, Large }
