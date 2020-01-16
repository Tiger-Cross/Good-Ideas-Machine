/// Apparently interfaces don't work in dart like they do in Java. ///

class DataManager<Q, D, R> {
  DataManager();

  Future<Q> getDataCollection() {
    print("Write a function to get a collection of data");
    return null;
  }

  Stream<Q> streamDataCollection() {
    print("Write a function to stream collection of data");
    return null;
  }

  Future<D> getDocumentById(String id) {
    print("Write a function to get a document by it's id");
    return null;
  }

  Future<R> addDocument(Map data) {
    print("Write a function that adds a document to the database");
    return null;
  }

  Future<void> removeDocument(String id) {
    print("Write a function that removes a document from the database");
    return null;
  }

  Future<void> updateDocument(Map data, String id) {
    print("Write a function that updates a document in the database");
    return null;
  }
}
