import 'package:flutter/material.dart';

import 'ideas.dart';
import 'collaborators.dart';
import 'newidea.dart';

void main() => runApp(GoodIdeasMachine());

class GoodIdeasMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var appTitle = 'Good Ideas Machine';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
        accentColor: Colors.cyanAccent,
        scaffoldBackgroundColor: Colors.indigo[900],
        tabBarTheme: TabBarTheme(unselectedLabelColor: Colors.cyan,
            labelColor: Colors.cyanAccent)
      ),
      home: HomeScaffold(title: appTitle)
    );
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final List<Widget> _childPages = [
    IdeasPage(),
    NewIdeaPage(),
    CollaboratorsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: TabBarView(children: _childPages),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: new Icon(Icons.assignment), text: 'Ideas'),
            Tab(icon: new Icon(Icons.lightbulb_outline), text: 'New Idea',),
            Tab(icon: Icon(Icons.group), text: 'Collaborators',),
          ],
        ),
      ),
    );
  }
}
