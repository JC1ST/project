import 'package:flutter/material.dart';
import 'package:shopping_app/views/shared/app_style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.label, required this.buttonClr});

  final void Function()? onPress;
  final String label;
  final Color buttonClr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.09,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(
          child: Text(
            label,
            style: appstyle(16, buttonClr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
