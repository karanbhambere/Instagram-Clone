import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instagram_clone/screens/home_screen_section.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  final String label;
  const HomeScreen({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenPage();
  }
}

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  Widget _widgetBody = const HomeScreenSection();
  int _currrentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) async {
    setState(() {
      if (index == 0) {
        _currrentIndex = index;
        _widgetBody = const HomeScreenSection();
      } else if (index == 1) {
        _currrentIndex = index;
        _widgetBody = const Center(
          child: Text('Hell'),
        );
      } else if (index == 2) {
        _currrentIndex = index;
        _widgetBody = const Center(
          child: Text('Hell'),
        );
      } else if (index == 3) {
        _currrentIndex = index;
        _widgetBody = const Center(
          child: Text('Hell'),
        );
      } else if (index == 4) {
        _currrentIndex = index;
        _widgetBody = const Center(
          child: Text('Hell'),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        title: Column(
          children: [
            Image.asset(
              'assets/logo insta.png',
              width: 100,
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            FeatherIcons.camera,
            color: Colors.grey[800],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.send,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _widgetBody,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currrentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _currrentIndex == 0
                ? Icon(
                    MdiIcons.home,
                    size: 25,
                  )
                : Icon(MdiIcons.homeOutline, size: 25),
            label: 'Feed',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search, size: 25),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.plusSquare, size: 25),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: _currrentIndex == 3
                ? Icon(MdiIcons.heart, size: 25)
                : Icon(MdiIcons.heartOutline, size: 25),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
              icon: _currrentIndex == 4
                  ? Icon(MdiIcons.accountCircle, size: 25)
                  : Icon(MdiIcons.account, size: 25),
              label: 'account'),
        ],
      ),
    );
  }
}
