import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blackjack/game.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 2),
            TextLiquidFill(
              text: 'BLACKJACK',
              waveColor: Colors.pinkAccent,
              boxBackgroundColor: Colors.black,
              textStyle: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              boxHeight: 120,
            ),
            Spacer(flex: 1),
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlackJackGame()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Game Start",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
