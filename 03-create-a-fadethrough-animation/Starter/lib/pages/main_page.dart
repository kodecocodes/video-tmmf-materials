import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'create_article.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 180,
        ),
      ),
      body: const HomePage(),
      floatingActionButton: OpenContainer(
        closedColor: Theme.of(context).accentColor,
        closedShape: const CircleBorder(),
        closedElevation: 6,
        closedBuilder: (context, _) {
          return const FloatingActionButton(
            elevation: 0,
            onPressed: null,
            child: Icon(Icons.add),
          );
        },
        openBuilder: (context, _) {
          return const CreateArticle();
        },
      ),
    );
  }
}
