import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';
import 'package:flip_card_plus/flip_card_plus.dart';

import '../models/collection.dart';
import '../models/deck.dart';
import '../models/card.dart';

void main() {
  return runApp(const FlashcardPage(deckID: -1));
}

class FlashcardPage extends StatefulWidget {
  final int deckID;
  const FlashcardPage({super.key, required this.deckID});

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  late QuillController frontController;
  late QuillController backController;
  int index = 0;
  bool showBack = false;

  @override
  void initState() {
    super.initState();
    frontController = QuillController.basic();
    frontController.readOnly = true;
    backController = QuillController.basic();
    backController.readOnly = true;
    context.read<Collection>().fetchDeckandCardsByDeckID(widget.deckID);
  }

  @override
  void dispose() {
    frontController.dispose();
    backController.dispose();
    super.dispose();
  }

  void loadCard(int i) {
    final cards = context.read<Collection>().currentCards;
    if (cards.isEmpty) return;
    final card = cards[i];
    frontController.document = Document.fromJson(jsonDecode(card.front));
    backController.document = Document.fromJson(jsonDecode(card.back));

    setState(() {
      index = i;
      showBack = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = context.watch<Collection>();
    Deck currentDeck = database.currentDecks[0];
    List<Card> cards = database.currentCards;
    cards.shuffle();
    loadCard(0);

    return Scaffold(
      appBar: AppBar(title: Text(currentDeck.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FlipCardPlus(
            perspective: 0.0015,
            fill: Fill.back,
            initialSide: CardSide.front,
            front: Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IgnorePointer(
                ignoring: true,
                child: QuillEditor.basic(
                  controller: frontController,
                  config: const QuillEditorConfig(
                    showCursor: false,
                    enableInteractiveSelection: false,
                  ),
                ),
              ),
            ),
            back: Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IgnorePointer(
                ignoring: true,
                child: QuillEditor.basic(
                  controller: backController,
                  config: const QuillEditorConfig(
                    showCursor: false,
                    enableInteractiveSelection: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
