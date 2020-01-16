import 'package:flutter/material.dart';
import 'package:good_ideas_machine/core/models/Idea.dart';

class IdeaCard extends StatelessWidget {
  final Idea ideaDetails;

  const IdeaCard({@required this.ideaDetails});




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // TODO: create Dialog;
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Text(ideaDetails.title)
            ),
          ),
        );
  }
}