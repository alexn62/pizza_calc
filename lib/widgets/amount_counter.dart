import 'package:flutter/material.dart';
import 'package:pizza_calc/services/general_services.dart';

class AmountCounter extends StatelessWidget {
  const AmountCounter({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GeneralServices model;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
