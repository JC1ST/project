import 'package:flutter/material.dart';
import 'package:game_tetris/game.dart';

class ActionButton extends StatelessWidget {
  final Function? onClickedFunction;
  final Icon? buttonIcon;
  final LastButtonPressed? nextAction;

  ActionButton(
      {super.key, this.onClickedFunction, this.buttonIcon, this.nextAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          onClickedFunction!(nextAction);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue,
        ),
        child: buttonIcon,
      ),
    );
  }
}
