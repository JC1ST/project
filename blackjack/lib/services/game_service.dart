import 'package:blackjack/models/player_model.dart';
import 'package:playing_cards/playing_cards.dart';

enum GameState { playerActive, playerWon, dealerWon, equal, none }

abstract class GameService {
  void startNewGame();
  PlayingCard drawCard();
  void endTurn();
  Player getPlayer();
  Player getDealer();
  int getScore(Player player);
  GameState getGameState();
  String getWinner();
}
