import 'package:flutter/material.dart';
import 'game.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tetris',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Main Menu'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Menu(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Play'),
        centerTitle: true,
        leading: new IconButton(
          onPressed: () async {
            timer!.cancel();
            Navigator.pop(context);
          },
          icon: new Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Game(),
    );
  }
}
