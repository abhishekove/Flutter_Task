import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pos/pos_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'database/moor_database.dart';

void init(){
  GetIt.I.registerLazySingleton(() => AppDatabase());
  GetIt.I.registerLazySingleton(() => PosApiService.create());
}

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          builder: (_)=>GetIt.I<AppDatabase>(),
        ),
        Provider<PosApiService>(
          builder: (_)=>GetIt.I<PosApiService>(),
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
  List<Poste> post=new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check"),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _push),
        ],
      ),
      body: _buildBody(context),
    );
  }
  void _push(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  FutureBuilder<Response> _buildBody(BuildContext context){
    return FutureBuilder<Response>(
      future: Provider.of<PosApiService>(context).getPoss(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          final List posts=json.decode(snapshot.data.bodyString);

          if(post.length==0){
            for(int i=0;i<posts.length;i++){
              post.add(new Poste(title: posts[i]['title'], body: posts[i]['body'], isSaved: false));
            }
          }
          return _buildPost(context,post);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  ListView _buildPost(BuildContext context,List<Poste> posts){
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context,index){
        var saved=posts[index].isSaved;
        return ListTile(
          title: Text(
              posts[index].title
          ),
          subtitle: Text(
              posts[index].body
          ),
          trailing: Icon(
            saved ? Icons.favorite:Icons.favorite_border,
            color: saved ? Colors.red : null,
          ),
          onTap: (){
            _save(index);
          },
        );
      },
    );
  }
  void _save(int i){
    final database = Provider.of<AppDatabase>(context);
    setState(() {
      post.removeAt(i);
      post.insert(0,new Poste(title: post[i].title, body: post[i].body, isSaved: true));
    });
    database.insertTask(new Poste(title: post[i].title, body: post[i].body, isSaved: true));
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
    return ListTile(
      title: Text(
        itemTask.title
      ),
      subtitle: Text(
        itemTask.body
      ),
      onTap: (){
          database.deleteTask(itemTask);
      },
    );
  }
}