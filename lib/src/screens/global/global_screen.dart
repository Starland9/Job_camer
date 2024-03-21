import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_camer/src/screens/admin/admin_screen.dart';
import 'package:job_camer/src/screens/home/home_screen.dart';
import 'package:job_camer/src/screens/profile/profile_screen.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const AdminScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _updateCurrentScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Admin",
          )
        ],
        currentIndex: _currentIndex,
      ),
    );
  }

  void _updateCurrentScreen(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
