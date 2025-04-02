import 'package:flutter/material.dart';

class RadioButtonDemo extends StatefulWidget {
  const RadioButtonDemo({super.key});

  @override
  State<RadioButtonDemo> createState() => _RadioButtonDemoState();
}

enum Language { java, python, dart, kotlin }

class _RadioButtonDemoState extends State<RadioButtonDemo> {
  Language book = Language.java;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button Demo", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Java"),
            leading: Radio(
              value: Language.java,
              groupValue: book,
              onChanged: (Language? value) {
                setState(() {
                  book = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Python"),
            leading: Radio(
              value: Language.python,
              groupValue: book,
              onChanged: (Language? value) {
                setState(() {
                  book = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Dart"),
            leading: Radio(
              value: Language.dart,
              groupValue: book,
              onChanged: (Language? value) {
                setState(() {
                  book = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Kotilin"),
            leading: Radio(
              value: Language.kotlin,
              groupValue: book,
              onChanged: (value) {
                setState(() {
                  book = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
