import 'package:blackjack/models/player_model.dart';
import 'package:blackjack/services/card_service.dart';
import 'package:blackjack/services/card_service_impl.dart';
import 'package:blackjack/services/game_service.dart';
import 'package:playing_cards/src/model/playing-card.dart';

const HIGHES_SCORE_VALUE = 21;
const int DEALER_MIN_SCORE = 16;

class GameServiceImpl extends GameService {
  late Player player;
  late Player dealer;
  GameState gameState = GameState.none;

  GameServiceImpl() {
    dealer = Player(_cardService.drawCards(2));
    player = Player(_cardService.drawCards(2));
  }

  final CardService _cardService = CardServiceImpl();

  @override
  PlayingCard drawCard() {
    final drawnCard = _cardService.drawCard();
    player.hand.add(drawnCard);
    if (getScore(player) >= HIGHES_SCORE_VALUE) {
      endTurn();
    }
    return drawnCard;
  }

  @override
  void endTurn() {
    int dealerScore = getScore(dealer);
    while (dealerScore < DEALER_MIN_SCORE) {
      dealer.hand.add(_cardService.drawCard());
      dealerScore = getScore(dealer);
    }

    // Get Burnt Players
    final playerScore = getScore(player);
    final bool burntDealer = (dealerScore > HIGHES_SCORE_VALUE);
    final bool burntPlayer = (playerScore > HIGHES_SCORE_VALUE);

    // Find Game Result
    if (burntDealer && burntPlayer) {
      gameState = GameState.equal;
    } else if (dealerScore == playerScore) {
      gameState = GameState.equal;
    } else if (burntDealer && playerScore <= HIGHES_SCORE_VALUE) {
      playerWon();
    } else if (burntPlayer && dealerScore <= HIGHES_SCORE_VALUE) {
      dealerWon();
    } else if (dealerScore < playerScore) {
      playerWon();
    } else if (dealerScore > playerScore) {
      dealerWon();
    } else {
      gameState = GameState.none;
    }
  }

  @override
  Player getDealer() {
    return dealer;
  }

  @override
  GameState getGameState() {
    return gameState;
  }

  @override
  Player getPlayer() {
    return player;
  }

  @override
  int getScore(Player player) {
    return mapCardValueRules(player.hand);
  }

  @override
  String getWinner() {
    if (GameState.dealerWon == gameState) {
      return "Dealer";
    }
    if (GameState.playerWon == gameState) {
      return "Player";
    }
    return "Nobody";
  }

  @override
  void startNewGame() {
    player.hand = _cardService.drawCards(2);
    dealer.hand = _cardService.drawCards(2);
    _cardService.new52deck();
    gameState = GameState.playerActive;
  }

  void playerWon() {
    gameState = GameState.playerWon;
    player.won += 1;
    dealer.lose += 1;
    player.wonBet();
  }

  void dealerWon() {
    gameState = GameState.dealerWon;
    dealer.won += 1;
    player.lose += 1;
    player.lostBet();
  }
}

// Map blackjack rules for card values to the PlayingCard enum
int mapCardValueRules(List<PlayingCard> cards) {
  List<PlayingCard> standardCards = cards
      .where((card) => (0 <= card.value.index && card.value.index <= 11))
      .toList();

  final sumStandardCards = getSumOfStandardCards(standardCards);

  int accessAmount = cards.length - standardCards.length;
  if (accessAmount == 0) {
    return sumStandardCards;
  }

  // Special Case : Ace could be value 1 or 11
  final pointsLeft = HIGHES_SCORE_VALUE - sumStandardCards;
  final oneAceIsEleven = 11 + (accessAmount - 1);

  // One Ace with value 11 fits
  if (pointsLeft >= oneAceIsEleven) {
    return sumStandardCards + oneAceIsEleven;
  }

  return sumStandardCards + accessAmount;
}

int getSumOfStandardCards(List<PlayingCard> standardCards) {
  return standardCards.fold<int>(
      0, (sum, card) => sum + mapStandardCardValue(card.value.index));
}

int mapStandardCardValue(int cardEnumIndex) {
  // ignore: constant_identifier_names
  const GAP_BETWEEN_INDEX_AND_VALUE = 2;

  // Card value 2-10 -> index between 0 and 8
  if (0 <= cardEnumIndex && cardEnumIndex <= 8) {
    return cardEnumIndex + GAP_BETWEEN_INDEX_AND_VALUE;
  }

  // Card is Jack, Queen, King -> index between 9 and 11
  if (9 <= cardEnumIndex && cardEnumIndex <= 11) {
    return 10;
  }

  return 0;
}
