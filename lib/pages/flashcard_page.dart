import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcard Page')),
      body: Center(
        child: Text('This is the Flashcard Page:' + widget.deckID.toString()),
      ),
    );
  }
}
