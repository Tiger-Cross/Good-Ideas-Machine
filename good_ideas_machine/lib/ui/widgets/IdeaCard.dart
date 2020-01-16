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
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.45,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: ideaDetails.title,
                  child: Text(ideaDetails.title)
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        ideaDetails.description,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}