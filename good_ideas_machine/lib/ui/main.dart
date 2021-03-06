import 'package:flutter/material.dart';
import 'package:good_ideas_machine/core/viewmodels/IdeasManager.dart';
import 'package:good_ideas_machine/locator.dart';
import 'package:provider/provider.dart';

import 'views/ideas.dart';
import 'views/collaborators.dart';
import 'views/newidea.dart';

void main() {
  setupLocator();
  runApp(GoodIdeasMachine());
}

class GoodIdeasMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appTitle = 'Good Ideas Machine';

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<IdeasManager>(create: (_) => IdeasManager())
        ],
        child: MaterialApp(
            title: appTitle,
            theme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.cyan,
                accentColor: Colors.cyanAccent,
                scaffoldBackgroundColor: Colors.indigo[900],
                tabBarTheme: TabBarTheme(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 5.0, color: Colors.indigo),
                        insets: EdgeInsets.symmetric(horizontal:16.0)
                    ),
                    unselectedLabelColor: Colors.indigo,
                    labelColor: Colors.indigo[900])),
            home: HomeScaffold(title: appTitle)),
    );
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final List<Widget> _childPages = [
    IdeasPage(),
    NewIdeaPage(),
    CollaboratorsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: TabBarView(
          children: _childPages,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          color: Colors.cyan,
          child: TabBar(
            tabs: [
              Tab(icon: new Icon(Icons.assignment), text: 'Ideas'),
              Tab(
                icon: new Icon(Icons.lightbulb_outline),
                text: 'New Idea',
              ),
              Tab(
                icon: Icon(Icons.group),
                text: 'Collaborators',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
