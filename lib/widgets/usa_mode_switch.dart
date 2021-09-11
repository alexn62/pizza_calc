import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_calc/constants/spacing.dart';
import 'package:pizza_calc/services/general_services.dart';

class USAModeSwitch extends StatelessWidget {
  const USAModeSwitch({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GeneralServices model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 90 : 60,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).backgroundColor, width: 0.5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vTinySpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text('NON USA MODE',
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor))),
              hTinySpace,
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
              hTinySpace,
              Center(
                  child: Text('USA MODE',
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor))),
            ],
          ),
        ],
      ),
    );
  }
}
