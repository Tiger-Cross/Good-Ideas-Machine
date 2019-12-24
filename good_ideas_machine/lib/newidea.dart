import 'package:flutter/material.dart';

class NewIdeaPage extends StatefulWidget {

  @override
  _NewIdeaPageState createState() => _NewIdeaPageState();
}

class _NewIdeaPageState extends State<NewIdeaPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Record New Idea", textScaleFactor: 2),
                TextFormField(),
                TextFormField(),
                Slider(value: 0, onChanged: null),
                Slider(value: 0, onChanged: null),
                Slider(value: 0, onChanged: null),
              ],
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Record Idea',
        child: Icon(Icons.check),
      ),
    );
  }
}