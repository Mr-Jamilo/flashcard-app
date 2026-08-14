import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';

import '../models/collection.dart';
import '../models/deck.dart';
import '../models/card.dart';

void main() {
  runApp(const CardEditorPage(cardID: -1));
}

class CardEditorPage extends StatefulWidget {
  final int cardID;
  const CardEditorPage({super.key, required this.cardID});

  @override
  State<CardEditorPage> createState() => _CardEditorPageState();
}

class _CardEditorPageState extends State<CardEditorPage> {
  late QuillController frontController;
  late QuillController backController;
  late QuillController currentController;
  final FocusNode frontFocusNode = FocusNode();
  final FocusNode backFocusNode = FocusNode();
  late Card card;

  final _formKey = GlobalKey<FormState>();
  int? dropdownValue;

  @override
  void initState() {
    super.initState();
    frontController = QuillController.basic();
    backController = QuillController.basic();
    currentController = frontController;
    frontFocusNode.addListener(_updateCurrentController);
    backFocusNode.addListener(_updateCurrentController);
    fetchDecks();

    if (widget.cardID != -1) {
      fetchCard(widget.cardID);
    }
  }

  void _updateCurrentController() {
    if (frontFocusNode.hasFocus && currentController != frontController) {
      setState(() {
        currentController = frontController;
      });
    } else if (backFocusNode.hasFocus && currentController != backController) {
      setState(() {
        currentController = backController;
      });
    }
  }

  @override
  void dispose() {
    frontController.dispose();
    backController.dispose();
    super.dispose();
  }

  void submitCard() async {
    final frontContent = jsonEncode(
      frontController.document.toDelta().toJson(),
    );
    final backContent = jsonEncode(backController.document.toDelta().toJson());

    if (widget.cardID == -1) {
      context.read<Collection>().createCard(
        dropdownValue!,
        frontContent,
        backContent,
      );
    } else {
      context.read<Collection>().updateCard(
        widget.cardID,
        frontContent,
        backContent,
        dropdownValue!,
      );
    }
  }

  void fetchDecks() {
    context.read<Collection>().fetchDecks();
  }

  void fetchCard(int cardID) {
    card = context.read<Collection>().fetchCard(cardID)!;
    frontController.document = Document.fromJson(jsonDecode(card.front));
    backController.document = Document.fromJson(jsonDecode(card.back));
    dropdownValue = card.deckId;
  }

  @override
  Widget build(BuildContext context) {
    final database = context.watch<Collection>();
    List<dynamic> currentDecks = database.currentDecks;

    final defaultStyle = DefaultStyles(
      paragraph: DefaultTextBlockStyle(
        const TextStyle(fontSize: 20.0, color: Colors.black, height: 1.15),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardID == -1 ? 'Add Card' : 'Edit Card'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              // Preview card
            },
          ),
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                submitCard();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownMenuFormField(
                menuHeight: 280,
                label: const Text('Select A Deck'),
                expandedInsets: EdgeInsets.zero,
                enableSearch: true,
                initialSelection: widget.cardID == -1 ? -1 : card.deckId,
                dropdownMenuEntries: currentDecks
                    .map(
                      (deck) =>
                          DropdownMenuEntry(value: deck.id, label: deck.name),
                    )
                    .toList(),
                onSelected: (deckID) {
                  setState(() {
                    dropdownValue = deckID;
                  });
                },
                validator: (value) {
                  if (value == -1) {
                    return 'Please select a deck';
                  }
                  return null;
                },
              ),
              QuillSimpleToolbar(
                controller: currentController,
                config: const QuillSimpleToolbarConfig(
                  multiRowsDisplay: false,
                  showFontFamily: false,
                  showFontSize: false,
                  showSearchButton: false,
                  showColorButton: false,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Front',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: currentController == frontController
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: QuillEditor.basic(
                    controller: frontController,
                    focusNode: frontFocusNode,
                    config: QuillEditorConfig(customStyles: defaultStyle),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Back', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: currentController == backController
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: QuillEditor.basic(
                    controller: backController,
                    focusNode: backFocusNode,
                    config: QuillEditorConfig(customStyles: defaultStyle),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
