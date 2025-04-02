import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Checkbox Example',style:TextStyle(color: Colors.white) ,),backgroundColor: Colors.indigo,),
        body: Container(
          padding: EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                'Checkbox with Header and Subtitle',
                style: TextStyle(fontSize: 20.0),
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.location_city_sharp),
                title: const Text('City'),
                subtitle: Text('Pune'),
                value: valuefirst,
                onChanged: (bool? value) {
                  setState(() {
                    valuefirst = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(Icons.location_city),
                title: const Text('State'),
                subtitle: Text('Maharashtra'),
                value: valuesecond,
                onChanged: (bool? value) {
                  setState(() {
                    valuesecond = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
