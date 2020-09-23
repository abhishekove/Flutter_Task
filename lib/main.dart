import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/moor_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase(),
      child:  MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context)),
          ],
        ));
  }

  StreamBuilder<List<Post>> _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Post itemTask, AppDatabase database) {
    final saved=itemTask.isSaved;
    return ListTile(
      title: Text(
        itemTask.title
      ),
      subtitle: Text(
        itemTask.body
      ),
      trailing: Icon(
        saved ? Icons.favorite:Icons.favorite_border,
        color: saved ? Colors.red : null,
      ),
    );
  }
}