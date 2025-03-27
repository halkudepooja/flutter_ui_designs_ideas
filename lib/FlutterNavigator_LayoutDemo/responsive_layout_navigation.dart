import 'package:flutter/material.dart';

import 'second_screen.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Layouts")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Row example for horizontal layout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Row Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Row Item 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Column example for vertical layout
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Column Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Column Item 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Stack example for overlapping layout
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.brown[400],
                    child: Center(
                      child: Text(
                        "Stack background",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ), 
                  SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.brown[100],
                    child: Center(
                      child: Text(
                        'Stack Foreground',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                color: Colors.grey,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      width: 100,
                      color: Colors.pink[(index + 1) * 100],
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
          
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 20),
              //Grid View Example
               Container(
                height: 200,
                color: Colors.blueGrey[100],
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.cyan[(index + 1) * 100],
                      child: Center(
                        child: Text(
                          'Grid Item $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
          // Navigate to another screen using a button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('Go to Second Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
