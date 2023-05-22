import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_tetris/blocks/Iblock.dart';
import 'package:game_tetris/blocks/Jblock.dart';
import 'package:game_tetris/blocks/Lblock.dart';
import 'package:game_tetris/blocks/Sblock.dart';
import 'package:game_tetris/blocks/Tblock.dart';
import 'package:game_tetris/blocks/Zblock.dart';
import 'package:game_tetris/blocks/block.dart';
import 'package:game_tetris/blocks/sqBlock.dart';
import 'package:game_tetris/game.dart';

Block? getRandomBlock() {
  int randomNr = Random().nextInt(7);
  switch (randomNr) {
    case 0:
      return IBlock(BOARD_WIDTH);
    case 1:
      return JBlock(BOARD_WIDTH);
    case 2:
      return LBlock(BOARD_WIDTH);
    case 3:
      return SBlock(BOARD_WIDTH);
    case 4:
      return SquareBlock(BOARD_WIDTH);
    case 5:
      return TBlock(BOARD_WIDTH);
    case 6:
      return ZBlock(BOARD_WIDTH);
    default:
  }
  return null;
}

Widget getTetrisPoint(Color? color) {
  return Container(
    width: POINT_SIZE,
    height: POINT_SIZE,
    decoration: new BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
    ),
  );
}

Widget getGameOverText(int score) {
  return Center(
    child: Text(
      'Game Over\nEnd Score: $score',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 3.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
    ),
  );
}
