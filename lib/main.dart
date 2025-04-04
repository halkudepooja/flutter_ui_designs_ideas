import 'package:flutter/material.dart';

import 'SplashScreen/SplashScreenDesign.dart';
import 'SplashScreen/home_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       routes: {
       // "/": (context) => OnboardingScreen(),
        "/home": (context) => const SplashHome()
      },
      home:SpalshScreen(),
          //AnimatedBox(),
          //SMS_Demo(),  //Send SMS,mail, and call from flutter app using external application.
          //CustomWidgetScreen(), //custom wodget button demo
          //AnimationScreen(), //animation demo
          //LayoutDemo(), //responsive layout demo such row,column,listview,gridview,stack
          //CupertinoButtonApp(), //Cupertino widget demo for button
          //SelectEmpName(), //serach filed
          // TimeCardListView(), //API integration-Get list view demo
          //TabBarscreen(), //tab bar example
          // SideDrawerScreen(),   //drawer example
          //  LoginScreen(), //API integration-Post login demo
          //PercentIndicator(title: 'Percenet Indicator Demo',),  //percentage downloading demo
          //RatingBarDEMO(),  //ratiung bar
          // ButtonDemo(),  //custom button demo in flutter
          //    CheckBoxDemo(), //checkbox demo
          // RadioButtonDemo(), //radio buttons
          // flutterButtonsDemo() //flutter buttons-elevatyed,outlined,text,dropdown,popupmenu button
         // FlutterTableDemo(), //table demo
      //const MyHomePage(title: 'Flutter Demo Home Page'),
      
    );
  }
}
