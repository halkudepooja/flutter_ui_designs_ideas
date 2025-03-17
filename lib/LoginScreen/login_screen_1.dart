import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../HomeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.blue.shade100,
                labelText: "User Name",
                labelStyle: TextStyle(color: Colors.black),
                hintText: "Enter User Name",
                hintStyle: TextStyle(color: Colors.black),
                enabled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black),
                hintText: "Enter Password",
                hintStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.blue.shade100,
                enabled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                animationDuration: Duration(seconds: 6),
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  if (userNameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    _validate = true;
                  } else {
                    loginAPICall(
                      userNameController.text,
                      passwordController.text,
                    );
                  }
                });
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> loginAPICall(String username, String password) async {
    try {
      var loginUrl =
          "http://103.19.136.117/One_Application_Flutter/Common_Services.svc/DoLogin";
      print(("login Url : $loginUrl"));

      final msg = jsonEncode({"UserName": username, "CONFPass": password});

      var res = await http.post(Uri.parse(loginUrl),
          headers: {'Content-Type': 'application/json'}, body: msg);
      //print("Doligin URL" + IModelDelegate.loginUrl + "DoLogin");

      print('Response body: ${res.body}');
      Map<String, dynamic> data = jsonDecode(res.body);

      if (data['DoLoginResult']["Respons"] == "OK") {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setInt("Emp_Pk", data['DoLoginResult']["Emp_PK"]);
        pref.setBool("isLoggedIn", true);
        pref.setString("employeecode", data['DoLoginResult']['Employee_Code']);
        pref.setString("employeename", data['DoLoginResult']['Employee_Name']);
        print("employeecode:::${data['DoLoginResult']['Employee_Code']}");
        print("employeename:::${data['DoLoginResult']['Employee_Name']}");
        print("Emp_Pk:::${data['DoLoginResult']['Emp_PK']}");

        _showMyDialog(data['DoLoginResult']["Respons"].toString());
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        // );
        return data['DoLoginResult']["Respons"];
      } else {
        return data['DoLoginResult']["Respons"];
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  _showMyDialog(responsMsg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Sucess'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Login Sucessesfully :: $responsMsg"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Continue'),
              onPressed: () {
                print('Confirmed');

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
