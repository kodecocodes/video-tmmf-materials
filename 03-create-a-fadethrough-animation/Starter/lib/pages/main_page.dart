import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'create_article.dart';
import 'home_page.dart';
import 'inbox_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const InboxPage(),
  ];

  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          width: 180,
        ),
      ),
      body: IndexedStack(
        key: ValueKey<int>(_selectedIndex),
        index: _selectedIndex,
        children: <Widget>[..._pages],
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        fixedColor: Theme.of(context).accentColor,
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            label: 'Inbox',
            icon: Icon(Icons.mail),
          ),
        ],
      ),
    );
  }
}
