import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataManager {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/ideas.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  Future<List<String>> readLines() async {
    try {
      final file = await _localFile;
      // Read the file
      List<String> lines = await file.readAsLines()
      return lines;
    } catch (e) {
      return Future.error("Error!");
    }
  }


  Future<File> writeContent(String data) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(data + "\n");
  }

}