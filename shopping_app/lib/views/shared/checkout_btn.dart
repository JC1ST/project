import 'package:flutter/material.dart';
import 'package:shopping_app/views/shared/app_style.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    this.onTap,
    required this.label,
  });

  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          child: Center(
            child: Text(
              label,
              style: appstyle(
                20,
                Colors.white,
                FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}