// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Poste extends DataClass implements Insertable<Poste> {
  final String title;
  final int id;
  final String body;
  final bool isSaved;
  Poste(
      {@required this.title,
      @required this.id,
      @required this.body,
      @required this.isSaved});
  factory Poste.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Poste(
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
      isSaved:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_saved']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || isSaved != null) {
      map['is_saved'] = Variable<bool>(isSaved);
    }
    return map;
  }

  PostesCompanion toCompanion(bool nullToAbsent) {
    return PostesCompanion(
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      isSaved: isSaved == null && nullToAbsent
          ? const Value.absent()
          : Value(isSaved),
    );
  }

  factory Poste.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Poste(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'isSaved': serializer.toJson<bool>(isSaved),
    };
  }

  Poste copyWith({String title, int id, String body, bool isSaved}) => Poste(
        title: title ?? this.title,
        id: id ?? this.id,
        body: body ?? this.body,
        isSaved: isSaved ?? this.isSaved,
      );
  @override
  String toString() {
    return (StringBuffer('Poste(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(title.hashCode,
      $mrjc(id.hashCode, $mrjc(body.hashCode, isSaved.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Poste &&
          other.title == this.title &&
          other.id == this.id &&
          other.body == this.body &&
          other.isSaved == this.isSaved);
}

class PostesCompanion extends UpdateCompanion<Poste> {
  final Value<String> title;
  final Value<int> id;
  final Value<String> body;
  final Value<bool> isSaved;
  const PostesCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.isSaved = const Value.absent(),
  });
  PostesCompanion.insert({
    @required String title,
    this.id = const Value.absent(),
    @required String body,
    this.isSaved = const Value.absent(),
  })  : title = Value(title),
        body = Value(body);
  static Insertable<Poste> custom({
    Expression<String> title,
    Expression<int> id,
    Expression<String> body,
    Expression<bool> isSaved,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (isSaved != null) 'is_saved': isSaved,
    });
  }

  PostesCompanion copyWith(
      {Value<String> title,
      Value<int> id,
      Value<String> body,
      Value<bool> isSaved}) {
    return PostesCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      body: body ?? this.body,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostesCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }
}

class $PostesTable extends Postes with TableInfo<$PostesTable, Poste> {
  final GeneratedDatabase _db;
  final String _alias;
  $PostesTable(this._db, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isSavedMeta = const VerificationMeta('isSaved');
  GeneratedBoolColumn _isSaved;
  @override
  GeneratedBoolColumn get isSaved => _isSaved ??= _constructIsSaved();
  GeneratedBoolColumn _constructIsSaved() {
    return GeneratedBoolColumn('is_saved', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [title, id, body, isSaved];
  @override
  $PostesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'postes';
  @override
  final String actualTableName = 'postes';
  @override
  VerificationContext validateIntegrity(Insertable<Poste> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body'], _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved'], _isSavedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Poste map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Poste.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PostesTable createAlias(String alias) {
    return $PostesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PostesTable _postes;
  $PostesTable get postes => _postes ??= $PostesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [postes];
}
