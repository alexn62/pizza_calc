import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_calc/constants/spacing.dart';
import 'package:pizza_calc/enums/enums.dart';
import 'package:pizza_calc/services/general_services.dart';
import 'package:pizza_calc/widgets/amount_counter.dart';
import 'package:pizza_calc/widgets/divider_with_title.dart';
import 'package:pizza_calc/widgets/generic_button.dart';
import 'package:pizza_calc/widgets/ingredient_component.dart';
import 'package:pizza_calc/widgets/usa_mode_bg.dart';
import 'package:pizza_calc/widgets/usa_mode_switch.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GeneralServices>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          flexibleSpace: !model.usaMode ? Container() : const USAModeBg(),
          elevation: 0,
          actions: [
            Icon(
                !model.getDarkMode()
                    ? Icons.light_mode
                    : Icons.light_mode_outlined,
                color: Theme.of(context).backgroundColor),
            hTinySpace,
            Switch.adaptive(
                thumbColor: MaterialStateProperty.all(
                    Theme.of(context).backgroundColor),
                inactiveTrackColor:
                    Theme.of(context).backgroundColor.withOpacity(.2),
                activeTrackColor:
                    Theme.of(context).backgroundColor.withOpacity(.8),
                value: model.getDarkMode(),
                onChanged: (value) async {
                  await model.setDarkMode(value);
                }),
            hTinySpace,
            Icon(
                !model.getDarkMode()
                    ? Icons.dark_mode_outlined
                    : Icons.dark_mode,
                color: Theme.of(context).backgroundColor),
            hRegularSpace,
          ],
          centerTitle: false,
          title: Text('Pizza Calculator',
              style: GoogleFonts.robotoMono().copyWith(
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            child: Container(
                height: 0.5, color: Theme.of(context).backgroundColor),
            preferredSize: const Size.fromHeight(1.0),
          ),
        ),
        bottomNavigationBar: USAModeSwitch(model: model),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            vRegularSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GenericButton(
                      title: 'Small',
                      active: model.size == PizzaSize.Small ? true : false,
                      onTap: () => model.setSize(PizzaSize.Small)),
                  hTinySpace,
                  GenericButton(
                      title: 'Regular',
                      active: model.size == PizzaSize.Regular ? true : false,
                      onTap: () => model.setSize(PizzaSize.Regular)),
                  hTinySpace,
                  GenericButton(
                      title: 'Large',
                      active: model.size == PizzaSize.Large ? true : false,
                      onTap: () => model.setSize(PizzaSize.Large)),
                ],
              ),
            ),
            vRegularSpace,
            const DividerWithTitle(title: 'Servings'),
            vRegularSpace,
            AmountCounter(model: model),
            vRegularSpace,
            const DividerWithTitle(title: 'Dough'),
            vRegularSpace,
            IngredientComponent(
                title: 'Flour',
                value: model.calculateAmount(ingredient: Ingredient.Flour)),
            vBigSpace,
            IngredientComponent(
                title: 'Water',
                value: model.calculateAmount(ingredient: Ingredient.Water)),
            vBigSpace,
            IngredientComponent(
                title: 'Active Dry Yeast',
                value: model.calculateAmount(ingredient: Ingredient.Yeast)),
            vBigSpace,
            IngredientComponent(
                title: 'Salt',
                value: model.calculateAmount(ingredient: Ingredient.Salt)),
            vRegularSpace,
            const DividerWithTitle(title: 'Sauce'),
            vRegularSpace,
            IngredientComponent(
                title: 'Tomatoes',
                value: model.calculateAmount(ingredient: Ingredient.Tomatoes)),
            vBigSpace,
            IngredientComponent(
                title: 'Olive Oil',
                value: model.calculateAmount(ingredient: Ingredient.OliveOil)),
            vBigSpace,
            IngredientComponent(
                title: 'Salt',
                value: model.calculateAmount(ingredient: Ingredient.SauceSalt)),
            vBigSpace,
            IngredientComponent(
                title: 'Basil',
                value: model.calculateAmount(ingredient: Ingredient.Basil)),
            vBigSpace,
            IngredientComponent(
                title: 'Pepper',
                value: model.calculateAmount(ingredient: Ingredient.Pepper)),
            vRegularSpace,
          ],
        ));
  }
}
