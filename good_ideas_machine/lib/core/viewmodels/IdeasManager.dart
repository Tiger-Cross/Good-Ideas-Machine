import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:good_ideas_machine/core/models/Idea.dart';
import 'package:good_ideas_machine/core/services/FirebaseDataManager.dart';
import 'package:good_ideas_machine/locator.dart';

class IdeasManager extends ChangeNotifier {

  FirebaseDataManager _dataManager = locator<FirebaseDataManager>();

  List<Idea> ideas;

  Future<List<Idea>> fetchIdeas() async {
    var result = await _dataManager.getDataCollection();
    ideas = result.documents
        .map((doc) => Idea.fromMap(doc.data, doc.documentID))
        .toList();
    return ideas;
  }

  Stream<QuerySnapshot> fetchIdeasAsStream() {
    return _dataManager.streamDataCollection();
  }

  Future<Idea> getIdeaByTitle(String title) async {
    var doc = await _dataManager.getDocumentByTitle(title);
    return  Idea.fromMap(doc.data, doc.documentID) ;
  }

  Future removeIdea(String title) async{
    await _dataManager.removeDocument(title) ;
    return ;
  }

  Future updateIdea(Idea data,String title) async{
    await _dataManager.updateDocument(data.toJson(), title) ;
    return ;
  }

  Future addIdea(Idea idea, String title) async{
    await _dataManager.addDocument(idea.toJson(), title) ;
    return ;

  }


}