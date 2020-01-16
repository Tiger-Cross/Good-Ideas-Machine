import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'IdeaCard.dart';

class IdeasPage extends StatefulWidget {

  @override
  _IdeasPageState createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('ideas').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>
                snapshot) {
                  if (snapshot.hasError) {
                    return new Text('Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return new Text("You haven't got  any ideas yet. Why" +
                          "not create one?");
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new IdeaCard(
                            title: document['title'],
                            description: document['description'],
                          );
                        }).toList(),
                      );
                  }
                })
        ),
      ),

    );
  }
}