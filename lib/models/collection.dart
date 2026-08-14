import 'package:flutter/material.dart' hide Card;
import 'package:isar_plus/isar_plus.dart';
import 'package:temp_app/models/card.dart';
import 'package:temp_app/models/deck.dart';
import 'package:path_provider/path_provider.dart';

class Collection extends ChangeNotifier {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = Isar.open(schemas: [DeckSchema, CardSchema], directory: dir.path);
  }

  final currentDecks = [];
  final currentCards = [];

  Future<void> createDeck(String text) async {
    await isar.writeAsync((isar) {
      final newDeck = Deck(id: isar.decks.autoIncrement(), name: text);
      isar.decks.put(newDeck);
    });
    await fetchDecks();
  }

  Future<void> fetchDeckandCardsByDeckID(int deckId) async {
    final fetchedDeck = await isar.decks.get(deckId);
    currentDecks.clear();
    currentDecks.add(fetchedDeck!);
    final fetchedCards = await isar.cards
        .where()
        .deckIdEqualTo(deckId)
        .findAllAsync();
    currentCards.clear();
    currentCards.addAll(fetchedCards);
    notifyListeners();
  }

  int getCardCountForDeck(int deckId) {
    return isar.cards.where().deckIdEqualTo(deckId).count();
  }

  Future<void> fetchDecks() async {
    final fetchedDecks = await isar.decks.where().findAllAsync();
    currentDecks.clear();
    currentDecks.addAll(fetchedDecks);
    notifyListeners();
  }

  Future<void> updateDeckName(int id, String newName) async {
    final existingDeck = await isar.decks.get(id);
    if (existingDeck != null) {
      existingDeck.name = newName;
      await isar.writeAsync((isar) => isar.decks.put(existingDeck));
      await fetchDecks();
    }
  }

  Future<void> deleteDeck(int id) async {
    await isar.writeAsync((isar) => isar.decks.delete(id));
    await fetchDecks();
  }

  Future<void> createCard(int deckId, String front, String back) async {
    await isar.writeAsync((isar) {
      final selectedDeck = isar.decks.get(deckId);
      if (selectedDeck != null) {
        final newCard = Card(
          id: isar.cards.autoIncrement(),
          front: front,
          back: back,
          deckId: deckId,
        );
        isar.cards.put(newCard);
      }
    });
    await fetchAllCards();
  }

  Card? fetchCard(int cardId) {
    try {
      return currentCards.firstWhere((card) => card.id == cardId);
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchAllCards() async {
    final fetchedCards = await isar.cards.where().findAllAsync();

    currentCards.clear();
    currentCards.addAll(fetchedCards);
    notifyListeners();
  }

  Future<void> fetchCardsFromDeck(int deckId) async {
    final deck = isar.decks.get(deckId);
    if (deck != null) {
      final fetchedCards = await isar.cards
          .where()
          .deckIdEqualTo(deckId)
          .findAllAsync();
      currentCards.clear();
      currentCards.addAll(fetchedCards);
      notifyListeners();
    }
  }

  Future<void> fetchCardsFromDeckList(List<int> deckList) async {
    final fetchedCards = await isar.cards
        .where()
        .anyOf(deckList, (q, int deckId) => q.deckIdEqualTo(deckId))
        .findAllAsync();

    currentCards.clear();
    currentCards.addAll(fetchedCards);
    notifyListeners();
  }

  Future<void> updateCard(
    int cardId,
    String newFront,
    String newBack,
    int newDeckId,
  ) async {
    final existingCard = await isar.cards.get(cardId);
    final newDeck = await isar.decks.get(newDeckId);

    if (existingCard != null && newDeck != null) {
      existingCard.front = newFront;
      existingCard.back = newBack;
      existingCard.deckId = newDeckId;
      await isar.writeAsync((isar) => isar.cards.put(existingCard));
      await fetchAllCards();
    }
  }

  Future<void> deleteCard(int cardId) async {
    await isar.writeAsync((isar) => isar.cards.delete(cardId));
    await fetchAllCards();
  }
}
