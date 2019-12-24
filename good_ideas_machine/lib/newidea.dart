import 'package:flutter/material.dart';

class NewIdeaPage extends StatefulWidget {
  @override
  _NewIdeaPageState createState() => _NewIdeaPageState();
}

class _NewIdeaPageState extends State<NewIdeaPage> {
  final _formKey = GlobalKey<FormState>();
  final _ideaTitleController = TextEditingController();
  final _ideaDescController = TextEditingController();

  void submitNewIdea() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      print("New idea called: " + _ideaTitleController.text);
      print("Idea description: " + _ideaDescController.text);
    }
  }

  @override
  void dispose() {
    _ideaTitleController.dispose();
    _ideaDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Record New Idea",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextFormField(
                    controller: _ideaTitleController,
                    decoration: InputDecoration(
                      labelText: 'Idea Name',
                    ),
                    style: Theme.of(context).textTheme.headline,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please give your idea a name!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ideaDescController,
                    decoration: InputDecoration(
                        labelText: 'Idea Description', hintText: '(Optional)'),
                  ),
                  Slider(value: 0, onChanged: null),
                  Slider(value: 0, onChanged: null),
                  Slider(value: 0, onChanged: null),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitNewIdea,
        tooltip: 'Record Idea',
        child: Icon(Icons.check),
      ),
    );
  }
}
