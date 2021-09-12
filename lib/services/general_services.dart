import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_calc/constants/per_serving.dart';
import 'package:pizza_calc/constants/units.dart';
import 'package:pizza_calc/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String roundToNearestQuarter(double unitsPerOne) {
    double am = ((unitsPerOne * amount * sizeConversion) / 0.25).round() * 0.25;
    int frac = int.parse(am.toStringAsFixed(2).split('.')[1]);
    return am.floor().toStringAsFixed(0) + fraction(frac);
  }

  String calculateAmount(
      {required Ingredient ingredient}) {
    String amount = getAmount(ingredient);
    String unit = getUnit(ingredient);

    return amount + unit;
  }

  String getAmount(Ingredient ingredient) {
    if (usaMode) {
      if (ingredient == Ingredient.Basil || ingredient == Ingredient.Water) {
        return (USA_PER_SERVING_MAP[ingredient]! * amount * sizeConversion)
            .toStringAsFixed(ingredient == Ingredient.Water ? 1 : 0);
      }
      return roundToNearestQuarter(USA_PER_SERVING_MAP[ingredient]!);
    }
    return (PER_SERVING_MAP[ingredient]! * amount * sizeConversion)
        .toStringAsFixed(0);
  }

  String getUnit(Ingredient ingredient) {
    if (usaMode) {
      return USA_UNIT_MAP[ingredient]!;
    }
    return UNIT_MAP[ingredient]!;
  }

}


