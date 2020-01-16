import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:good_ideas_machine/core/models/Idea.dart';
import 'package:good_ideas_machine/core/viewmodels/IdeasManager.dart';
import 'package:provider/provider.dart';

import '../widgets/IdeaCard.dart';

class IdeasPage extends StatefulWidget {
  @override
  _IdeasPageState createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  List<Idea> ideas;

  @override
  Widget build(BuildContext context) {
    final ideaProvider = Provider.of<IdeasManager>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: StreamBuilder(
              stream: ideaProvider.fetchIdeasAsStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return new Text('Error: ${snapshot.error}');
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return new Text("You haven't saved any ideas yet. Head " +
                        "next door to record one =>");
                  case ConnectionState.waiting:
                    return new Text("Loading your awesome Ideas...");
                  default:
                    ideas = snapshot.data.documents
                        .map((doc) => Idea.fromMap(doc.data, doc.documentID))
                        .toList();
                    return ListView.builder(
                      itemCount: ideas.length,
                      itemBuilder: (buildContext, index) =>
                          IdeaCard(ideaDetails: ideas[index]),
                    );
                }
              }),
        ),
      ),
    );
  }
}
