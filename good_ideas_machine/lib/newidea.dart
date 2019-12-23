import 'package:flutter/material.dart';

class NewIdeaPage extends StatefulWidget {
  @override
  _NewIdeaPageState createState() => _NewIdeaPageState();

}

class _NewIdeaPageState extends State<NewIdeaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Record Idea',
        child: Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}