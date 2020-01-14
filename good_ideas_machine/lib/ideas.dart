import 'package:flutter/material.dart';

class IdeasPage extends StatefulWidget {

  @override
  _IdeasPageState createState() => _IdeasPageState();
}

//// TODO: Use to get, edit and delete idea contents
//void getData(){
//  databaseReference.once().then((DataSnapshot snapshot) {
//    print('Data : ${snapshot.value}');
//  });
//}
//
//void deleteData(){
//  databaseReference.child('1').remove();
//}
//
//void updateData(){
//  databaseReference.child('1').update({
//    'description': 'J2EE complete Reference'
//  });
//}

class _IdeasPageState extends State<IdeasPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Coming soon...")
          ],
        ),
      ),

    );
  }
}