import 'package:blackjack/services/card_service.dart';
import 'package:playing_cards/playing_cards.dart';

class CardServiceImpl extends CardService {
  List<PlayingCard> deck = [];
  List<PlayingCard> discardPile = [];

  CardServiceImpl() {
    new52deck();
  }

  @override
  void discardCard(PlayingCard card) {
    discardPile.add(card);
  }

  @override
  void discardCards(List<PlayingCard> cards) {
    discardPile.addAll(cards);
  }

  @override
  PlayingCard drawCard() {
    return _handleDrawCard(1).first;
  }

  @override
  List<PlayingCard> drawCards(int amount) {
    return _handleDrawCard(amount);
  }

  // Start a new game
  @override
  void new52deck() {
    discardPile = [];
    deck = shuffleCards(standardFiftyTwoCardDeck());
  }

  @override
  List<PlayingCard> shuffleCards(List<PlayingCard> deck) {
    deck.shuffle();
    return deck;
  }

  List<PlayingCard> _handleDrawCard(int amount) {
    int deckSize = getDeckSize();
    int cardsLeft = deckSize - amount;

    // Not enough cards left in deck?
    // Remember to discard old cards
    if (cardsLeft < 0) {
      deck = [...shuffleCards(discardPile), ...deck];

      discardPile = [];
      deckSize = getDeckSize();
      cardsLeft = deckSize - amount;
    }

    List<PlayingCard> drawnCards = deck.getRange(cardsLeft, deckSize).toList();
    deck.removeRange(cardsLeft, deckSize);

    return drawnCards;
  }

  int getDeckSize() {
    return deck.length - 1;
  }
}
