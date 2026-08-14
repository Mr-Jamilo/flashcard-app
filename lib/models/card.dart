import 'package:isar_plus/isar_plus.dart';

part 'card.g.dart';

@collection
class Card {
  final int id;
  String front;
  String back;

  @Index()
  int deckId;

  Card({
    required this.id,
    required this.front,
    required this.back,
    required this.deckId,
  });
}
