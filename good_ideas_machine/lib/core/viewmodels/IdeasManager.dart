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

  Future<Idea> getIdeaById(String id) async {
    var doc = await _dataManager.getDocumentById(id);
    return  Idea.fromMap(doc.data, doc.documentID) ;
  }

  Future removeIdea(String id) async{
    await _dataManager.removeDocument(id) ;
    return ;
  }
  Future updateIdea(Idea data,String id) async{
    await _dataManager.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addIdea(Idea data) async{
    var result  = await _dataManager.addDocument(data.toJson()) ;
    return ;

  }


}