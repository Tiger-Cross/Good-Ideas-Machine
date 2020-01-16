import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataManager {

  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  FirebaseDataManager(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentByTitle(String title) {
    return ref.document(title).get();
  }

  Future<void> addDocument(Map data, String title) {
    return ref.document(title).setData(data);
  }

  Future<void> removeDocument(String title) {
    return ref.document(title).delete();
  }

  Future<void> updateDocument(Map data, String title) {
    return ref.document(title).updateData(data);
  }

}