import 'package:flutter/material.dart';
import 'package:pizza_calc/constants/spacing.dart';

class DividerWithTitle extends StatelessWidget {
  final String title;
  const DividerWithTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        hRegularSpace,
        Expanded(
          child: Container(
              height: .3, color: Theme.of(context).backgroundColor),
        ),
        hTinySpace,
        Text(title, style: TextStyle(color: Theme.of(context).backgroundColor),),
        hTinySpace,
        Expanded(
          child: Container(
              height: .3, color: Theme.of(context).backgroundColor),
        ),
        hRegularSpace,
      ],
    );
  }
}
