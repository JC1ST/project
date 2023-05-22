import 'package:flutter/material.dart';
import 'package:game_tetris/actionButton.dart';
import 'game.dart';

class UserInput extends StatelessWidget {
  final Function? onActionButtonPressed;
  UserInput({super.key, this.onActionButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            ActionButton(
              onClickedFunction: onActionButtonPressed,
              buttonIcon: Icon(Icons.rotate_left),
              nextAction: LastButtonPressed.ROTATE_LEFT,
            ),
            ActionButton(
              onClickedFunction: onActionButtonPressed,
              buttonIcon: Icon(Icons.rotate_right),
              nextAction: LastButtonPressed.ROTATE_RIGHT,
            ),
          ],
        ),
        Row(
          children: [
            ActionButton(
              onClickedFunction: onActionButtonPressed,
              buttonIcon: Icon(Icons.arrow_left),
              nextAction: LastButtonPressed.LEFT,
            ),
            ActionButton(
              onClickedFunction: onActionButtonPressed,
              buttonIcon: Icon(Icons.arrow_right),
              nextAction: LastButtonPressed.RIGHT,
            ),
          ],
        ),
      ],
    );
  }
}
