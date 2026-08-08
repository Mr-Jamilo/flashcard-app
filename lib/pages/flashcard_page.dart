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
  bool flipped = false;
  bool showButton1 = false;
  bool showButton2 = false;

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedPositioned(
            top: flipped ? 100.0 : 230.0,
            left: 16.0,
            right: 16.0,
            height: MediaQuery.of(context).size.height / 4,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: FlipCardPlus(
              onFlipDone: (side) {
                setState(() {
                  if (flipped == false) {
                    flipped = true;
                    Future.delayed(const Duration(milliseconds: 150), () {
                      if (mounted) setState(() => showButton1 = true);
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      if (mounted) setState(() => showButton2 = true);
                    });
                  }
                });
              },
              perspective: 0.0015,
              fill: Fill.back,
              initialSide: CardSide.front,
              front: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
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
                  border: Border.all(color: Colors.blue, width: 3),
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
          Positioned(
            bottom: MediaQuery.of(context).size.height / 5,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Button 1: "Again"
                AnimatedOpacity(
                  opacity: showButton1 ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: AnimatedSlide(
                    offset: showButton1 ? Offset.zero : const Offset(0, 0.5),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: IconButton.outlined(
                      onPressed: showButton1
                          ? () {
                              print("Needs Review");
                            }
                          : null,
                      icon: const Icon(Icons.close, color: Colors.red),
                      iconSize: 50,
                      style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 3),
                      ),
                    ),
                  ),
                ),

                // Button 2: "Good"
                AnimatedOpacity(
                  opacity: showButton2 ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: AnimatedSlide(
                    offset: showButton2 ? Offset.zero : const Offset(0, 0.5),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: IconButton.outlined(
                      onPressed: showButton2
                          ? () {
                              print("Got it right");
                            }
                          : null,
                      icon: const Icon(Icons.check, color: Colors.green),
                      iconSize: 50,
                      style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.green, width: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
