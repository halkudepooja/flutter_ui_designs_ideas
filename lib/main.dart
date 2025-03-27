import 'package:flutter/material.dart';
import 'package:flutter_screen_design_ideas/AnimationDemo/flutter_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:AnimatedBox(),
      //SMS_Demo(),  //Send SMS,mail, and call from flutter app using external application.
      
          //CustomWidgetScreen(), //custom wodget button demo
          //AnimationScreen(),
      //LayoutDemo(), //responsive layout demo such row,column,listview,gridview,stack
      //CupertinoButtonApp(), //Cupertino widget demo for button
      //SelectEmpName(), //serach filed
      // TimeCardListView(), //API integration-Get list view demo
      //TabBarscreen(), //tab bar example
      // SideDrawerScreen(),   //drawer example
      //LoginScreen(),     //API integration-Post login demo
      //PercentIndicator(title: 'Percenet Indicator Demo',),  //percentage downloading demo
      //RatingBarDEMO(),  //ratiung bar
      // ButtonDemo(),   //button demo
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
