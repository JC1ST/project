import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int? score;
  ScoreDisplay({super.key, this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
      ),
      child: Text(
        "Score\n$score",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
