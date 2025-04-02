import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class flutterButtonsDemo extends StatefulWidget {
  const flutterButtonsDemo({super.key});

  @override
  State<flutterButtonsDemo> createState() => _flutterButtonsDemoState();
}

class _flutterButtonsDemoState extends State<flutterButtonsDemo> {
  final List<String> dropdownItems = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? selectedValue = "Item 1"; // Initial selected value
  double _speakervolume = 0.0;
  int _volume = 0;
  bool isSwitched = false;
  final int _selectedIndex = 0;

  Choice _selectedOption = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("You selected ${choice.name}")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Flutter Buttons Demo",
          style: TextStyle(color: Colors.white),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => {displayDialog(context)},
          ),
          Tooltip(
            message: 'Profile',
            child: IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () => {},
            ),
          ),
          //popup menu button
          PopupMenuButton<Choice>(
            color: Colors.white,
            iconColor: Colors.white,
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(0).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.name),
                );
              }).toList();
            },
          ),
        ],
      ),

      //it gives label to my floating action button
      //      floatingActionButton:FloatingActionButton.extended(
      //   onPressed: () {},
      //   icon: Icon(Icons.save),
      //   label: Text("Save"),
      // ),
      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () => {},
        child: Icon(Icons.navigation),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Elevated Button"), //raised button
                //  SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have clicked Elevated Button"),
                      ),
                    );
                  },
                  child: Text("Elevated Button"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Text Button"), //flat button
                //    SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You have clicked Text Button")),
                    );
                  },
                  child: Text("Text Button"),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Outline Button"),

                //     SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have clicked Outlined Button"),
                      ),
                    );
                  },
                  child: Text("Outline Button"),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Dropdown Button", style: TextStyle(fontSize: 20)),
                //SizedBox(width: 20),
                DropdownButton<String>(
                  dropdownColor: Colors.grey,
                  value: selectedValue,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(height: 2, color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You have selected $selectedValue"),
                      ),
                    );
                  },
                  items:
                      dropdownItems.map<DropdownMenuItem<String>>((
                        String value,
                      ) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Icon Button", style: TextStyle(fontSize: 20)),
                IconButton(
                  icon: Icon(Icons.volume_up),
                  iconSize: 50,
                  color: Colors.brown,
                  tooltip: 'Increase volume by 5',
                  onPressed: () {
                    setState(() {
                      _speakervolume += 5;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Volume increased by 5 Speaker Volume: $_speakervolume",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("InkWell Button", style: TextStyle(fontSize: 20)),

                InkWell(
                  splashColor: Colors.green,
                  highlightColor: Colors.blue,
                  child: Icon(Icons.ring_volume, size: 50),
                  onTap: () {
                    setState(() {
                      _volume += 2;
                    });
                    showToast();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Volume Increased by$_volume")),
                    );
                  },
                ),

                // ChoiceCard(choice: _selectedOption),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 25.0),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black, size: 25.0),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_emergency,
              color: Colors.black,
              size: 25.0,
            ),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }

  //alert dialog code
  displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout ?'),
          content: Text("Do You want to logout?"),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: 'Volume Increased by$_volume',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.yellow,
    );
  }
}

class Choice {
  const Choice({required this.name, required this.icon});
  final String name;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(name: 'Wi-Fi', icon: Icons.wifi),
  Choice(name: 'Bluetooth', icon: Icons.bluetooth),
  Choice(name: 'Battery', icon: Icons.battery_alert),
  Choice(name: 'Storage', icon: Icons.storage),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({super.key, required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headlineMedium;
    return Card(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 115.0, color: textStyle!.color),
            Text(choice.name, style: textStyle),
          ],
        ),
      ),
    );
  }
}
