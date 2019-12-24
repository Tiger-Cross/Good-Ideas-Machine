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
  int _currNavIndex = 1;
  final List<Widget> _childPages = [
    IdeasPage(),
    NewIdeaPage(),
    CollaboratorsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _childPages[_currNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.white,
        currentIndex: _currNavIndex, // this will be set when a new tab is tapped
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.assignment),
            title: new Text('Ideas'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.lightbulb_outline),
            title: new Text('New Idea'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              title: Text('Collaborators')
          )
        ],
      ),
    );
  }
}
