import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Posts extends Table {
  TextColumn get title => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get body => text()();
  BoolColumn get isSaved => boolean().withDefault(Constant(false))();
}
@UseMoor(tables: [Posts])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;

  // Future<List<Task>>
  Future<List<Post>> getAllTasks() => select(posts).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Post>> watchAllTasks() => select(posts).watch();

  Future insertTask(Post task) => into(posts).insert(task);

  // Updates a Task with a matching primary key
  Future updateTask(Post task) => update(posts).replace(task);

  Future deleteTask(Post task) => delete(posts).delete(task);
}