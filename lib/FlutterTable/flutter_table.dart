import 'package:flutter/material.dart';

class FlutterTableDemo extends StatefulWidget {
  const FlutterTableDemo({super.key});

  @override
  State<FlutterTableDemo> createState() => _FlutterTableDemoState();
}

class _FlutterTableDemoState extends State<FlutterTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Table Demo")),
      body: Center(child: Column(children:[

        Container(
          child: Table(
            defaultColumnWidth: FixedColumnWidth(100),
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(children: [
                 Column(children:[Text('Product', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Quantity', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text(' Price', style: TextStyle(fontSize: 20.0))]),  
          
              ]),
 TableRow( children: [  
                        Column(children:[Text('Laptop')]),  
                        Column(children:[Text('3')]),  
                        Column(children:[Text('90000')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Mobile')]),  
                        Column(children:[Text('5')]),  
                        Column(children:[Text('80000')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Mouse')]),  
                        Column(children:[Text('10')]),  
                        Column(children:[Text('10000')]),  
                      ]),  

            ],
          ),
        )
      ]),
    ));
  }
}
