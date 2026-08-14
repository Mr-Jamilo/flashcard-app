import 'package:isar_plus/isar_plus.dart';

part 'deck.g.dart';

@collection
class Deck {
  final int id;
  String name;

  Deck({required this.id, required this.name});
}
