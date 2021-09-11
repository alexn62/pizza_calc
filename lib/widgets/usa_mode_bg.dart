import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class USAModeBg extends StatelessWidget {
  const USAModeBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: const AssetImage(
              'assets/usa_flag.jpg',
            )),
      ));
  }
}