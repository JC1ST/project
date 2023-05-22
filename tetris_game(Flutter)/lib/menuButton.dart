import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Function? onClickedFunction;

  MenuButton({super.key, this.onClickedFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClickedFunction!();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        fixedSize: Size(150, 60),
      ),
      child: Icon(Icons.play_arrow),
    );
  }
}
