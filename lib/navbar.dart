import 'package:flutter/material.dart';
import 'package:news_app/homepage.dart';
import 'package:news_app/newspaper_list.dart';
import 'package:news_app/videos.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // ignore: prefer_final_fields
  int index = 0;
  final screens = [const HomePage(), const NewsList(), const Videos()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        child: NavigationBar(
            backgroundColor: const Color.fromARGB(198, 255, 255, 255),
            height: 65,
            elevation: 3,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: Color.fromARGB(255, 195, 9, 3),
                  ),
                  label: 'Home'),
              NavigationDestination(
                icon: Icon(
                  Icons.newspaper,
                  size: 30,
                  color: Color.fromARGB(255, 195, 9, 3),
                ),
                label: 'Newspaper',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.ondemand_video,
                  size: 30,
                  color: Color.fromARGB(255, 195, 9, 3),
                ),
                label: 'Video',
              ),
            ]),
      ),
    );
  }
}
