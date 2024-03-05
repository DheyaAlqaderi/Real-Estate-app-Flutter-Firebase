import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/chat_page/chat_page.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/favorite_page/favorite_page.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/home_page/home_page.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/profile_page/profile_page.dart';

import '../../../widgets/bottom_nav.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int _bottomNavIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const ChatPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  List<String> titleList = [
    'Home',
    'ChatBox',
    'Favorite',
    'Profile',
  ];

  final List<IconData> lineIconsList = [
    LineIcons.home,
    LineIcons.rocketChat,
    LineIcons.heart,
    LineIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _bottomNavIndex != 0
          ? buildAppBar()
          : null,
      body: Center(
        child: IndexedStack(
          index: _bottomNavIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNav(
        bottomNavIndex: _bottomNavIndex,
        titles: titleList,
        icons: lineIconsList,
        onTabChange: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }





  Widget buildFloatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 70),
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          // Add your custom onPressed behavior here
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MapPage()),
          // );
        },
        tooltip: 'Open the Map',
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.map,
          color: Colors.black,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleList[_bottomNavIndex],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const Icon(Icons.notifications, color: Colors.black, size: 30.0),
        ],
      ),
      elevation: 0.0,
    );
  }


}
