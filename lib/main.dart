import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pos/pos_api_service.dart';
import 'package:provider/provider.dart';

import 'database/moor_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          builder: (_)=>AppDatabase(),
        ),
        Provider<PosApiService>(
          builder: (_)=>PosApiService.create(),
          dispose: (context,PosApiService service)=>service.client.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check"),
      ),
      body: _buildBody(context),
    );
  }
}

FutureBuilder<Response> _buildBody(BuildContext context){
  return FutureBuilder<Response>(
    future: Provider.of<PosApiService>(context).getPoss(),
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        final List posts=json.decode(snapshot.data.bodyString);
        return _buildPost(context,posts);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
ListView _buildPost(BuildContext context,List posts){
  return ListView.builder(
    itemCount: posts.length,
    padding: EdgeInsets.all(8),
    itemBuilder: (context,index){
      return ListTile(
        title: Text(
            posts[index]['title'],
        ),
        subtitle: Text(
          posts[index]['body'],
        ),
        trailing: Icon(
          Icons.favorite_border,
          color: null,
        ),
      );
    },
  );
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

  StreamBuilder<List<Poste>> _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Poste>> snapshot) {
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

  Widget _buildListItem(Poste itemTask, AppDatabase database) {
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