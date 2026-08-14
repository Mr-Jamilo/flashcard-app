// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetDeckCollection on Isar {
  IsarCollection<int, Deck> get decks => this.collection();
}

final DeckSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Deck',
    idName: 'id',
    embedded: false,
    properties: [IsarPropertySchema(name: 'name', type: IsarType.string)],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, Deck>(
    serialize: serializeDeck,
    deserialize: deserializeDeck,
    deserializeProperty: deserializeDeckProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeDeck(IsarWriter writer, Deck object) {
  IsarCore.writeString(writer, 1, object.name);
  return object.id;
}

@isarProtected
Deck deserializeDeck(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _name;
  _name = IsarCore.readString(reader, 1) ?? '';
  final object = Deck(id: _id, name: _name);
  return object;
}

@isarProtected
dynamic deserializeDeckProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _DeckUpdate {
  bool call({required int id, String? name});
}

class _DeckUpdateImpl implements _DeckUpdate {
  const _DeckUpdateImpl(this.collection);

  final IsarCollection<int, Deck> collection;

  @override
  bool call({required int id, Object? name = ignore}) {
    return collection.updateProperties(
          [id],
          {if (name != ignore) 1: name as String?},
        ) >
        0;
  }
}

sealed class _DeckUpdateAll {
  int call({required List<int> id, String? name});
}

class _DeckUpdateAllImpl implements _DeckUpdateAll {
  const _DeckUpdateAllImpl(this.collection);

  final IsarCollection<int, Deck> collection;

  @override
  int call({required List<int> id, Object? name = ignore}) {
    return collection.updateProperties(id, {
      if (name != ignore) 1: name as String?,
    });
  }
}

extension DeckUpdate on IsarCollection<int, Deck> {
  _DeckUpdate get update => _DeckUpdateImpl(this);

  _DeckUpdateAll get updateAll => _DeckUpdateAllImpl(this);
}

sealed class _DeckQueryUpdate {
  int call({String? name});
}

class _DeckQueryUpdateImpl implements _DeckQueryUpdate {
  const _DeckQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Deck> query;
  final int? limit;

  @override
  int call({Object? name = ignore}) {
    return query.updateProperties(limit: limit, {
      if (name != ignore) 1: name as String?,
    });
  }
}

extension DeckQueryUpdate on IsarQuery<Deck> {
  _DeckQueryUpdate get updateFirst => _DeckQueryUpdateImpl(this, limit: 1);

  _DeckQueryUpdate get updateAll => _DeckQueryUpdateImpl(this);
}

class _DeckQueryBuilderUpdateImpl implements _DeckQueryUpdate {
  const _DeckQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Deck, Deck, QOperations> query;
  final int? limit;

  @override
  int call({Object? name = ignore}) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (name != ignore) 1: name as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension DeckQueryBuilderUpdate on QueryBuilder<Deck, Deck, QOperations> {
  _DeckQueryUpdate get updateFirst =>
      _DeckQueryBuilderUpdateImpl(this, limit: 1);

  _DeckQueryUpdate get updateAll => _DeckQueryBuilderUpdateImpl(this);
}

extension DeckQueryFilter on QueryBuilder<Deck, Deck, QFilterCondition> {
  QueryBuilder<Deck, Deck, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<Deck, Deck, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 1, value: ''),
      );
    });
  }
}

extension DeckQueryObject on QueryBuilder<Deck, Deck, QFilterCondition> {}

extension DeckQuerySortBy on QueryBuilder<Deck, Deck, QSortBy> {
  QueryBuilder<Deck, Deck, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> sortByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> sortByNameDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension DeckQuerySortThenBy on QueryBuilder<Deck, Deck, QSortThenBy> {
  QueryBuilder<Deck, Deck, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> thenByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Deck, Deck, QAfterSortBy> thenByNameDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension DeckQueryWhereDistinct on QueryBuilder<Deck, Deck, QDistinct> {
  QueryBuilder<Deck, Deck, QAfterDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension DeckQueryProperty1 on QueryBuilder<Deck, Deck, QProperty> {
  QueryBuilder<Deck, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Deck, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension DeckQueryProperty2<R> on QueryBuilder<Deck, R, QAfterProperty> {
  QueryBuilder<Deck, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Deck, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension DeckQueryProperty3<R1, R2>
    on QueryBuilder<Deck, (R1, R2), QAfterProperty> {
  QueryBuilder<Deck, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Deck, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}
