import 'package:flutter/material.dart';
import 'package:game_tetris/main.dart';
import 'package:game_tetris/menuButton.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void onPlayClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tetris',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 8.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          MenuButton(onClickedFunction: onPlayClicked),
        ],
      ),
    );
  }
}
