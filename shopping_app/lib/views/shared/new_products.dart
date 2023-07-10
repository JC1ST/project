import 'package:flutter/material.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 0.8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Center(
        child: Image(
          image: AssetImage(image),
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
