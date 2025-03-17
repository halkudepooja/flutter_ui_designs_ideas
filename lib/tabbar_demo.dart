import 'package:flutter/material.dart';

class TabBarscreen extends StatefulWidget {
  const TabBarscreen({super.key});

  @override
  State<TabBarscreen> createState() => _TabBarscreenState();
}

class _TabBarscreenState extends State<TabBarscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Tabbar Demo",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              tabs: [
                Tab(child: Icon(Icons.phone_enabled_rounded)),
                Tab(child: Icon(Icons.message)),
                Tab(child: Icon(Icons.video_call)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab(child: Icon(Icons.phone_enabled_rounded)),
              Tab(child: Icon(Icons.message)),
              Tab(child: Icon(Icons.video_call)),
            ],
          ),
        ),
      ),
    );
  }
}
