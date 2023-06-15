import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blackjack/services/game_service.dart';
import 'package:blackjack/services/game_service_impl.dart';
import 'package:blackjack/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

GameService _gameService = GameServiceImpl();

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  color: Colors.yellow,
  backgroundColor: Colors.black,
);

class BlackJackGame extends StatefulWidget {
  const BlackJackGame({super.key});

  @override
  State<BlackJackGame> createState() => _BlackJackGameState();
}

class _BlackJackGameState extends State<BlackJackGame> {
  PlayingCard deckTopCard = PlayingCard(Suit.joker, CardValue.joker_1);

  @override
  void initState() {
    _gameService.getGameState() != GameState.playerActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Back button/gesture disable
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.green[800],
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SizedBox(height: 30),
                SizedBox(
                  child: Text(
                    "DEALER",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: _gameService.getDealer().hand.length * 78,
                  height: 160,
                  child: FlatCardFan(
                    children: [
                      for (var card in _gameService.getDealer().hand) ...[
                        CardAnimatedWidget(
                          playingCard: card,
                          showBack: (_gameService.getGameState() ==
                              GameState.playerActive),
                          elevation: 3.0,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            if (_gameService.getGameState() ==
                                GameState.playerActive) {
                              _gameService.drawCard();
                              setState(() {});
                            }
                          },
                          child: SizedBox(
                            width: 135,
                            child: FlatCardFan(
                              children: [
                                cardWidget(
                                    PlayingCard(Suit.joker, CardValue.joker_1),
                                    true),
                                cardWidget(
                                    PlayingCard(Suit.joker, CardValue.joker_2),
                                    true),
                                cardWidget(
                                    PlayingCard(Suit.joker, CardValue.joker_2),
                                    true),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_gameService.getGameState() ==
                                    GameState.playerActive) {
                                  _gameService.endTurn();
                                } else {
                                  _gameService.startNewGame();
                                }
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                textStyle: TextStyle(fontSize: 20),
                              ),
                              child: Text((() {
                                if (_gameService.getGameState() !=
                                    GameState.playerActive) {
                                  return "New Game";
                                }
                                return "Finish";
                              })()),
                            ),
                            SizedBox(height: 40),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                              child: Column(
                                children: [
                                  if (_gameService.getGameState() !=
                                      GameState.playerActive) ...[
                                    Text(
                                      "Dealer score: ${_gameService.getScore(_gameService.getDealer())}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Player score: ${_gameService.getScore(_gameService.getPlayer())}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Won: ${_gameService.getPlayer().won}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Lost: ${_gameService.getPlayer().lose}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: _gameService.getPlayer().hand.length * 78,
                  height: 160,
                  child: FlatCardFan(
                    children: [
                      for (var card in _gameService.getPlayer().hand) ...[
                        CardAnimatedWidget(
                          playingCard: card,
                          showBack: false,
                          elevation: 3.0,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: Text(
                    "PLAYER",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 45,
                            onPressed: () {
                              _gameService.getPlayer().setBetLower();
                              setState(() {});
                            },
                            icon: Icon(Icons.arrow_left),
                          ),
                          Text(
                            _gameService.getPlayer().bet.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            iconSize: 45,
                            onPressed: () {
                              _gameService.getPlayer().setBetHigher();
                              setState(() {});
                            },
                            icon: Icon(Icons.arrow_right),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wallet),
                          SizedBox(width: 7.5),
                          Text(
                            _gameService.getPlayer().wallet.toString() + " 원",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            Center(
              child: _gameService.getGameState() != GameState.none
                  ? Center(
                      child: _gameService.getGameState() == GameState.equal
                          ? Padding(
                              padding: EdgeInsets.only(top: 293),
                              child: Column(
                                children: [
                                  if (_gameService.getGameState() !=
                                      GameState.playerActive) ...[
                                    // Text Animation
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          "DRAW!!",
                                          colors: colorizeColors,
                                          textStyle: colorizeTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            )
                          : Transform.rotate(
                              angle: 350 * pi / 180,
                              child: Padding(
                                padding: _gameService.getGameState() ==
                                        GameState.dealerWon
                                    ? EdgeInsets.only(top: 119, left: 75)
                                    : EdgeInsets.only(top: 510, right: 63),
                                child: Column(
                                  children: [
                                    if (_gameService.getGameState() !=
                                        GameState.playerActive) ...[
                                      // Text Animation
                                      AnimatedTextKit(
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                            "WINNER!!",
                                            colors: colorizeColors,
                                            textStyle: colorizeTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
