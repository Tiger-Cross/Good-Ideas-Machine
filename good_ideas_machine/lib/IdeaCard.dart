import 'package:flutter/material.dart';

class IdeaCard extends StatelessWidget {
  IdeaCard({@required this.title, this.description});

  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title),
              ],
            )));
  }
}