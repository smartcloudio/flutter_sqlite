import 'package:flutter/material.dart';
import 'package:flutter_app/views/settings.dart';
import 'package:flutter_app/views/user_list.dart';
import 'package:flutter_app/views/usuario_list.dart';
import 'package:flutter_icons/flutter_icons.dart';

// The MainScreen who have a BottomNavigationBar Widget
// for create a navigation usability strategy for the app
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          UsuarioList(),
          UserList(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
            ),
            title: Text(
              'SQLite Users',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.download,
            ),
            title: Text(
              'inMemory Users',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.settings,
            ),
            title: Text(
              'Configuração',
            ),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
