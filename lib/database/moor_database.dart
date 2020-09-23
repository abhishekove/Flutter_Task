import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Postes extends Table {
  TextColumn get title => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get body => text()();
  BoolColumn get isSaved => boolean().withDefault(Constant(false))();
}
@UseMoor(tables: [Postes])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;

  // Future<List<Task>>
  Future<List<Poste>> getAllTasks() => select(postes).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Poste>> watchAllTasks() => select(postes).watch();

  Future insertTask(Poste task) => into(postes).insert(task);

  // Updates a Task with a matching primary key
  Future updateTask(Poste task) => update(postes).replace(task);

  Future deleteTask(Poste task) => delete(postes).delete(task);
}