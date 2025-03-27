import 'package:flutter/material.dart';

import 'custom_widget.dart'; 



class CustomWidgetScreen extends StatelessWidget {
  const CustomWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Button Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Button Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                padding: EdgeInsets.all(10.0),
                text: 'Primary Button',
                textColor: Colors.black,

                backgroundColor: Colors.blue,
                onPressed: () {
                  print('Primary Button Pressed');
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                padding: EdgeInsets.all(10.0),
                text: 'Secondary Button',
                backgroundColor: Colors.green,
                textColor: Colors.black,
                onPressed: () {
                  print('Secondary Button Pressed');
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                padding: EdgeInsets.all(10),
                text: 'Disabled Button',
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                onPressed: () {
                  print('Disabled Button Pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
