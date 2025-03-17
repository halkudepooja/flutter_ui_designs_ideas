import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? EmpPK;
  String? EmpName, EmpCode;

  @override
  void initState() {
    // TODO: implement initState
    loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Welcome "),
          SizedBox(height: 20),
          Text("Employee Name::$EmpName"),
          SizedBox(height: 20),
          Text("Employee PK::$EmpPK"),
          SizedBox(height: 20),
          Text("Employee Code::$EmpCode"),
        ],
      ),
    );
  }

  Future<void> loadCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    EmpPK = preferences.getInt("Emp_Pk");
    EmpCode = preferences.getString('employeecode');
    EmpName = preferences.getString('employeename');
  }
}
