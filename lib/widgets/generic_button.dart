import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final Function() onTap;
  final bool active;
  final String title;
  const GenericButton({
    required this.onTap,
    required this.active,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 30,
          decoration: BoxDecoration(
              color: active
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor,
              border: Border.all(color: Theme.of(context).backgroundColor),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: active
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
