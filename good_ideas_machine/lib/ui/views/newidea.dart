import 'package:flutter/material.dart';
import 'package:good_ideas_machine/core/models/Idea.dart';
import 'package:good_ideas_machine/core/viewmodels/IdeasManager.dart';
import 'package:provider/provider.dart';

class NewIdeaPage extends StatefulWidget {
  @override
  _NewIdeaPageState createState() => _NewIdeaPageState();
}

class _NewIdeaPageState extends State<NewIdeaPage> {
  double _originalitySliderValue = 0;
  double _feasibilitySliderValue = 0;
  double _impactSliderValue = 0;

  final _formKey = GlobalKey<FormState>();
  final _ideaTitleController = TextEditingController();
  final _ideaDescController = TextEditingController();

  Future<void> submitNewIdea(IdeasManager ideasManager) async {
    if (_formKey.currentState.validate()) {
      // TODO; Relate each individual idea to a single user (validator required)
      await ideasManager.addIdea(
          Idea(
            title: _ideaTitleController.text,
            description : _ideaDescController.text,
            originalityRating: _originalitySliderValue.round(),
            feasibilityRating: _feasibilitySliderValue.round(),
            impactRating: _impactSliderValue.round()
      ), _ideaTitleController.text);
      resetForm();
      _successDialog();
    }
  }

  void _successDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("That's a Great Idea!"),
          content: new Text("Thanks! We'll keep it safe for you."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void resetForm() {
    _ideaTitleController.clear();
    _ideaDescController.clear();
    setState(() {
      _originalitySliderValue = 0;
      _feasibilitySliderValue = 0;
      _impactSliderValue = 0;
    });
  }

  @override
  void dispose() {
    _ideaTitleController.dispose();
    _ideaDescController.dispose();
    super.dispose();
  }

  Widget ideaRankSlider(String sliderTitle, String sliderDesc, double sliderVal,
      ValueChanged<double> onChanged) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(sliderTitle),
        Tooltip(
            message: sliderDesc,
            preferBelow: false,
            child: Slider(
              label: sliderVal.toString(),
              divisions: 10,
              activeColor: Colors.cyan,
              value: sliderVal,
              min: 0.0,
              max: 10.0,
              onChanged: onChanged,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ideaRankSlider(
                      "Originality",
                      "How original you think your idea is on a scale of 1 to 10?",
                      _originalitySliderValue, (newVal) {
                    setState(() => _originalitySliderValue = newVal);
                  }),
                  ideaRankSlider(
                      "Feasibility",
                      "Rank the feasibility of creating your idea",
                      _feasibilitySliderValue, (newVal) {
                    setState(() => _feasibilitySliderValue = newVal);
                  }),
                  ideaRankSlider(
                      "Impact",
                      "What do you think the overall impact would be on others?",
                      _impactSliderValue, (newVal) {
                    setState(() => _impactSliderValue = newVal);
                  }),
                ],
              ),
            )),
      ),
      floatingActionButton: Consumer<IdeasManager>(
        builder: (context, IdeasManager, child) {
          return FloatingActionButton(
            onPressed: () => submitNewIdea(IdeasManager),
            tooltip: 'Record Idea',
            child: Icon(Icons.check),
          );
        },
      ),
    );
  }
}
