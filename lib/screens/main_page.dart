import 'package:flutter/material.dart';
import 'package:pizza_calc/constants/spacing.dart';
import 'package:pizza_calc/services/general_services.dart';
import 'package:pizza_calc/widgets/generic_button.dart';
import 'package:pizza_calc/widgets/ingredient_component.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GeneralServices>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            flexibleSpace: !model.usaMode
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        image: const AssetImage(
                          'assets/usa_flag.jpg',
                        )),
                  )),
            elevation: 0,
            actions: [
              Icon(
                  !model.getDarkMode()
                      ? Icons.light_mode
                      : Icons.light_mode_outlined,
                  color: Theme.of(context).backgroundColor),
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
              Icon(
                  !model.getDarkMode()
                      ? Icons.dark_mode_outlined
                      : Icons.dark_mode,
                  color: Theme.of(context).backgroundColor),
              hTinySpace,
            ],
            centerTitle: false,
            title: Text(
              'Pizza',
              style: TextStyle(color: Theme.of(context).backgroundColor),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: PreferredSize(
              child: Container(
                  height: 0.5, color: Theme.of(context).backgroundColor),
              preferredSize: const Size.fromHeight(1.0),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vRegularSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    GenericButton(title: 'Small', active: model.size == PizzaSize.Small ?  true : false, onTap: () => model.setSize(PizzaSize.Small)),
                    hTinySpace,
                    GenericButton(title: 'Medium', active: model.size == PizzaSize.Medium ?  true : false, onTap: () => model.setSize(PizzaSize.Medium)),
                    hTinySpace,
                    GenericButton(title: 'Large', active:model.size == PizzaSize.Large ?  true : false, onTap: () => model.setSize(PizzaSize.Large)),
                  ],
                ),
              ),
              vRegularSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: model.decreaseAmount,
                    icon: Icon(Icons.remove,
                        color: Theme.of(context).backgroundColor),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Text(
                        model.amount.toString(),
                        style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).backgroundColor),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: model.increaseAmount,
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ],
              ),
              vRegularSpace,
              IngredientComponent(title: 'Flour', value: model.flour),
              vBigSpace, 
              IngredientComponent(title: 'Water', value: model.water),
              vRegularSpace, 
              Expanded(child: Container()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Text('NON USA MODE',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor))),
                  Switch.adaptive(
                    value: model.usaMode,
                    onChanged: (val) {
                      model.setUsaMode(val);
                    },
                    thumbColor: MaterialStateProperty.all(
                        Theme.of(context).backgroundColor),
                    inactiveTrackColor:
                        Theme.of(context).backgroundColor.withOpacity(.2),
                    activeTrackColor:
                        Theme.of(context).backgroundColor.withOpacity(.8),
                  ),
                  Center(
                      child: Text('USA MODE',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor))),
                ],
              ),
              vRegularSpace
            ],
          )),
    );
  }
}

