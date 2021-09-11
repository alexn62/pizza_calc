import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      height: 50,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).backgroundColor, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text('NON USA MODE',
                  style: TextStyle(color: Theme.of(context).backgroundColor))),
          Switch.adaptive(
            value: model.usaMode,
            onChanged: (val) {
              model.setUsaMode(val);
            },
            thumbColor:
                MaterialStateProperty.all(Theme.of(context).backgroundColor),
            inactiveTrackColor:
                Theme.of(context).backgroundColor.withOpacity(.2),
            activeTrackColor: Theme.of(context).backgroundColor.withOpacity(.8),
          ),
          Center(
              child: Text('USA MODE',
                  style: TextStyle(color: Theme.of(context).backgroundColor))),
        ],
      ),
    );
  }
}
