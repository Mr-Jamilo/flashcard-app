// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCardCollection on Isar {
  IsarCollection<int, Card> get cards => this.collection();
}

final CardSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Card',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(name: 'front', type: IsarType.string),
      IsarPropertySchema(name: 'back', type: IsarType.string),
      IsarPropertySchema(name: 'deckId', type: IsarType.long),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'deckId',
        properties: ["deckId"],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, Card>(
    serialize: serializeCard,
    deserialize: deserializeCard,
    deserializeProperty: deserializeCardProp,
  ),
  getEmbeddedSchemas: () => [],
);

@isarProtected
int serializeCard(IsarWriter writer, Card object) {
  IsarCore.writeString(writer, 1, object.front);
  IsarCore.writeString(writer, 2, object.back);
  IsarCore.writeLong(writer, 3, object.deckId);
  return object.id;
}

@isarProtected
Card deserializeCard(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _front;
  _front = IsarCore.readString(reader, 1) ?? '';
  final String _back;
  _back = IsarCore.readString(reader, 2) ?? '';
  final int _deckId;
  _deckId = IsarCore.readLong(reader, 3);
  final object = Card(id: _id, front: _front, back: _back, deckId: _deckId);
  return object;
}

@isarProtected
dynamic deserializeCardProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readLong(reader, 3);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CardUpdate {
  bool call({required int id, String? front, String? back, int? deckId});
}

class _CardUpdateImpl implements _CardUpdate {
  const _CardUpdateImpl(this.collection);

  final IsarCollection<int, Card> collection;

  @override
  bool call({
    required int id,
    Object? front = ignore,
    Object? back = ignore,
    Object? deckId = ignore,
  }) {
    return collection.updateProperties(
          [id],
          {
            if (front != ignore) 1: front as String?,
            if (back != ignore) 2: back as String?,
            if (deckId != ignore) 3: deckId as int?,
          },
        ) >
        0;
  }
}

sealed class _CardUpdateAll {
  int call({required List<int> id, String? front, String? back, int? deckId});
}

class _CardUpdateAllImpl implements _CardUpdateAll {
  const _CardUpdateAllImpl(this.collection);

  final IsarCollection<int, Card> collection;

  @override
  int call({
    required List<int> id,
    Object? front = ignore,
    Object? back = ignore,
    Object? deckId = ignore,
  }) {
    return collection.updateProperties(id, {
      if (front != ignore) 1: front as String?,
      if (back != ignore) 2: back as String?,
      if (deckId != ignore) 3: deckId as int?,
    });
  }
}

extension CardUpdate on IsarCollection<int, Card> {
  _CardUpdate get update => _CardUpdateImpl(this);

  _CardUpdateAll get updateAll => _CardUpdateAllImpl(this);
}

sealed class _CardQueryUpdate {
  int call({String? front, String? back, int? deckId});
}

class _CardQueryUpdateImpl implements _CardQueryUpdate {
  const _CardQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Card> query;
  final int? limit;

  @override
  int call({
    Object? front = ignore,
    Object? back = ignore,
    Object? deckId = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (front != ignore) 1: front as String?,
      if (back != ignore) 2: back as String?,
      if (deckId != ignore) 3: deckId as int?,
    });
  }
}

extension CardQueryUpdate on IsarQuery<Card> {
  _CardQueryUpdate get updateFirst => _CardQueryUpdateImpl(this, limit: 1);

  _CardQueryUpdate get updateAll => _CardQueryUpdateImpl(this);
}

class _CardQueryBuilderUpdateImpl implements _CardQueryUpdate {
  const _CardQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Card, Card, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? front = ignore,
    Object? back = ignore,
    Object? deckId = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (front != ignore) 1: front as String?,
        if (back != ignore) 2: back as String?,
        if (deckId != ignore) 3: deckId as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension CardQueryBuilderUpdate on QueryBuilder<Card, Card, QOperations> {
  _CardQueryUpdate get updateFirst =>
      _CardQueryBuilderUpdateImpl(this, limit: 1);

  _CardQueryUpdate get updateAll => _CardQueryBuilderUpdateImpl(this);
}

extension CardQueryFilter on QueryBuilder<Card, Card, QFilterCondition> {
  QueryBuilder<Card, Card, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> idGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> idLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 0, value: value));
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 0, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 0, lower: lower, upper: upper),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> frontEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> frontGreaterThan(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontGreaterThanOrEqualTo(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 1, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> frontLessThanOrEqualTo(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontBetween(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontStartsWith(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontEndsWith(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontContains(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontMatches(
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

  QueryBuilder<Card, Card, QAfterFilterCondition> frontIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> frontIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 1, value: ''),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 2, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(property: 2, value: value, caseSensitive: caseSensitive),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(property: 2, value: ''),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> backIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(property: 2, value: ''),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdGreaterThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdLessThan(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(LessCondition(property: 3, value: value));
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(property: 3, value: value),
      );
    });
  }

  QueryBuilder<Card, Card, QAfterFilterCondition> deckIdBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(property: 3, lower: lower, upper: upper),
      );
    });
  }
}

extension CardQueryObject on QueryBuilder<Card, Card, QFilterCondition> {}

extension CardQuerySortBy on QueryBuilder<Card, Card, QSortBy> {
  QueryBuilder<Card, Card, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByFront({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByFrontDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByBack({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByBackDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByDeckId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> sortByDeckIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CardQuerySortThenBy on QueryBuilder<Card, Card, QSortThenBy> {
  QueryBuilder<Card, Card, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByFront({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByFrontDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByBack({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByBackDesc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByDeckId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Card, Card, QAfterSortBy> thenByDeckIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CardQueryWhereDistinct on QueryBuilder<Card, Card, QDistinct> {
  QueryBuilder<Card, Card, QAfterDistinct> distinctByFront({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterDistinct> distinctByBack({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Card, Card, QAfterDistinct> distinctByDeckId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }
}

extension CardQueryProperty1 on QueryBuilder<Card, Card, QProperty> {
  QueryBuilder<Card, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Card, String, QAfterProperty> frontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Card, String, QAfterProperty> backProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Card, int, QAfterProperty> deckIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CardQueryProperty2<R> on QueryBuilder<Card, R, QAfterProperty> {
  QueryBuilder<Card, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Card, (R, String), QAfterProperty> frontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Card, (R, String), QAfterProperty> backProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Card, (R, int), QAfterProperty> deckIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CardQueryProperty3<R1, R2>
    on QueryBuilder<Card, (R1, R2), QAfterProperty> {
  QueryBuilder<Card, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Card, (R1, R2, String), QOperations> frontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Card, (R1, R2, String), QOperations> backProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Card, (R1, R2, int), QOperations> deckIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
