//http://103.229.5.175/flutter_demo_to_client_sir/Common_Services.svc/GetUserProfile?Emp_PK=283

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List user = [];
  Dio dio = Dio();
  bool isLoading = false;
  int? empPK;
  var abcd;

  @override
void initState()  {
    // TODO: implement initState
    super.initState();
    loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: user.length,
        itemBuilder: (context, index) {
          if (index == user.length) {
            buildProgressIndicator();
          } else {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.indigo,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              (user[index]['Name']).toString(),
                              // 'Pooja Halkude'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              //'M0099',
                              user[index]['Employee_Code'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10.0, right: 10.0),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                // height: 95,
                                child: Column(
                                  children: [
                                    ExpansionTile(
                                      title: Text('Personal Details',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          )),
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Date Of Birth',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Birth_Date']).toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Phone Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Phone_Number'])
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Mobile Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Mobile_Number'])
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['EmailID']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Joining Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Join_Date']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Blood Group',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['BloodGroupCode'])
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10.0, right: 10.0),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                //  height: 95,
                                child: Column(
                                  children: [
                                    ExpansionTile(
                                      title: Text(
                                        'Address',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Temporary Address Line 1',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['TempAdd']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Country Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Country1']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'State',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['State1']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'City Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['City1']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Pincode',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Pincode1']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Permanent Address Line 1',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['PerAdd']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Country Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Country2']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'State',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['State2']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'City',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['City2']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Pin Code',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Pincode2']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10.0, right: 10.0),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                // height: 95,
                                child: Column(
                                  children: [
                                    ExpansionTile(
                                      title: Text(
                                        'Other',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Location',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Location_Name'])
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Department',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Dept_Name']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Designation',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Designation_Title'])
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'PAN NUMBER',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['PAN_No']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'PF NUMBER',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['PF_No']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'ESI No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['ESI_No']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Bank Account No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['Account_No'].toString()),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'UAN NUMBER',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['UAN_NUMBER']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Aadhaar Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            (user[0]['UID_NUMBER']).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ],
                )
              ],
            );
          }
          return null;
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Future<void> getUserProfileData(abcd) async {
    var Url =
        "http://103.229.5.175/flutter_demo_to_client_sir/Common_Services.svc/GetUserProfile?Emp_PK=283";
    //  var UserProfileUrl = Url + abcd;

    print("Profile Data Url::$Url");
    final res = await dio.get(Url);
    print(" response : ${res.data}");

    List tlist = [];
    for (int i = 0; i < res.data['GetUserProfileResult'].length; i++) {
      tlist.add(res.data['GetUserProfileResult'][i]);
    }

    setState(() {
      user.addAll(tlist);
    });
  }

  buildProgressIndicator() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Opacity(
            opacity: isLoading ? 1.0 : 00,
            child: CircularProgressIndicator(),
          ),
        ));
  }
  
 loadCounter() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

  //  setState(() {
  //     empPK = (prefs.getInt('emppk') ?? '') as int;
  //     abcd = empPK.toString();
  //   });
    getUserProfileData(abcd);
  }
}
