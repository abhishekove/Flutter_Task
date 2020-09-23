// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Post extends DataClass implements Insertable<Post> {
  final String title;
  final int id;
  final String body;
  final bool isSaved;
  Post(
      {@required this.title,
      @required this.id,
      @required this.body,
      @required this.isSaved});
  factory Post.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Post(
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

  PostsCompanion toCompanion(bool nullToAbsent) {
    return PostsCompanion(
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      isSaved: isSaved == null && nullToAbsent
          ? const Value.absent()
          : Value(isSaved),
    );
  }

  factory Post.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Post(
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

  Post copyWith({String title, int id, String body, bool isSaved}) => Post(
        title: title ?? this.title,
        id: id ?? this.id,
        body: body ?? this.body,
        isSaved: isSaved ?? this.isSaved,
      );
  @override
  String toString() {
    return (StringBuffer('Post(')
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
      (other is Post &&
          other.title == this.title &&
          other.id == this.id &&
          other.body == this.body &&
          other.isSaved == this.isSaved);
}

class PostsCompanion extends UpdateCompanion<Post> {
  final Value<String> title;
  final Value<int> id;
  final Value<String> body;
  final Value<bool> isSaved;
  const PostsCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.isSaved = const Value.absent(),
  });
  PostsCompanion.insert({
    @required String title,
    this.id = const Value.absent(),
    @required String body,
    this.isSaved = const Value.absent(),
  })  : title = Value(title),
        body = Value(body);
  static Insertable<Post> custom({
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

  PostsCompanion copyWith(
      {Value<String> title,
      Value<int> id,
      Value<String> body,
      Value<bool> isSaved}) {
    return PostsCompanion(
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
    return (StringBuffer('PostsCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }
}

class $PostsTable extends Posts with TableInfo<$PostsTable, Post> {
  final GeneratedDatabase _db;
  final String _alias;
  $PostsTable(this._db, [this._alias]);
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
  $PostsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'posts';
  @override
  final String actualTableName = 'posts';
  @override
  VerificationContext validateIntegrity(Insertable<Post> instance,
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
  Post map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Post.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PostsTable createAlias(String alias) {
    return $PostsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PostsTable _posts;
  $PostsTable get posts => _posts ??= $PostsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posts];
}
