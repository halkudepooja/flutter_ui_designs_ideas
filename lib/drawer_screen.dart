import 'package:flutter/material.dart';

class SideDrawerScreen extends StatefulWidget {
  const SideDrawerScreen({super.key});

  @override
  State<SideDrawerScreen> createState() => _SideDrawerScreenState();
}

class _SideDrawerScreenState extends State<SideDrawerScreen> {
  @override
  /// The Drawer has a DrawerHeader with a UserAccountsDrawerHeader. It also has a list of ListTiles such as My Profile, My Courses, Go Premium etc..
  ///
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer Screen")),
      body: Center(child: Text("Invisible drawer screen ")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                accountName: Text(
                  "Pooja Halkude",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("halkudepooja@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "PH",
                    style: TextStyle(fontSize: 30.0, color: Colors.black),
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
              subtitle: Text("Flutter Developer"),
            ),

            ListTile(leading: Icon(Icons.book), title: Text("My Courses")),

            ListTile(leading: Icon(Icons.person), title: Text("Go Premium ")),

            ListTile(
              leading: Icon(Icons.video_collection_rounded),
              title: Text("Saved Videos"),
            ),
            ListTile(
              leading: Icon(Icons.picture_in_picture_sharp),
              title: Text("Saved Pcitures"),
            ),
            ListTile(
              leading: Icon(Icons.edit_square),
              title: Text("Edit Profile"),
            ),

            ListTile(leading: Icon(Icons.edit_square), title: Text("logout")),
          ],
        ),
      ),
    );
  }
}
