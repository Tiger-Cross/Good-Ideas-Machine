import 'package:flutter/material.dart';

import 'newidea.dart';

void main() => runApp(GoodIdeasMachine());

class GoodIdeasMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Ideas Machine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewIdeaPage(),
    );
  }
}

