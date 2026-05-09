import 'package:flutter/material.dart';
import 'package:flutter_statefulwidget/home_screen.dart';
import 'package:flutter_statefulwidget/login_screen.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('6706074'),
          bottom: const TabBar(
            tabs: [Text('Home'), Text('Contract'), Text('My Profile')],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            Center(child: Text('Contract')),
            LoginScreen(),
          ],
        ),
      ),
    );
  }
}
