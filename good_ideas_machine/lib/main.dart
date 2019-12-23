import 'package:flutter/material.dart';

import 'newidea.dart';

void main() => runApp(GoodIdeasMachine());

class GoodIdeasMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var title = 'Good Ideas Machine';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
        accentColor: Colors.cyanAccent,
        scaffoldBackgroundColor: Colors.indigo[900],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: NewIdeaPage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.cyan,
          selectedItemColor: Colors.indigo[900],
          unselectedItemColor: Colors.white,
          currentIndex: 1, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.assignment),
              title: new Text('Ideas'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.blur_on),
              title: new Text('New Idea'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                title: Text('Collaborators')
            )
          ],
        ),
      ),
    );
  }
}
