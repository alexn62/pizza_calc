import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_calc/constants/spacing.dart';

class IngredientComponent extends StatelessWidget {
  final String title;
  final String value;
  const IngredientComponent({
    required this.title,
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        hRegularSpace,
        Text(
          title,
          style:
              TextStyle(color: Theme.of(context).backgroundColor, fontSize: 20),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          value,
          style:
              TextStyle(color: Theme.of(context).backgroundColor, fontSize: 20),
        ),
        hRegularSpace,
      ],
    );
  }
}
