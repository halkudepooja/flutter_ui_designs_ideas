import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TimeCardListView extends StatefulWidget {
  const TimeCardListView({super.key});

  @override
  State<TimeCardListView> createState() => _TimeCardListViewState();
}

class _TimeCardListViewState extends State<TimeCardListView> {
  var url =
      "http://103.229.5.175/flutter_demo_to_client_sir/Leave_Services.svc/GetTimeCard?Emp_PK=283&strstartdate=01/09/2024&strendate=30/09/2024";

  Dio dio = Dio();
  bool isLoading = false;

  List userList = [];

  @override
  void initState() {
    super.initState();
    _getTimecardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View Demo")),
      body: Column(
        children: [
          Container(child: _buildTimeCardList()),
          //if (userList.isEmpty) _selectUI(),
        ],
      ),
    );
  }

  void _getTimecardData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      print("Time card url::$url");
      final response = await dio.get(url);
      print(response.toString());

      List tList = [];

      for (int i = 0; i < response.data['GetTimeCardResult'].length; i++) {
        tList.add(response.data['GetTimeCardResult'][i]);
      }

      setState(() {
        isLoading = false;
        userList.addAll(tList);
      });
    }
  }

  _buildTimeCardList() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(10.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: userList.length,
        itemBuilder: (context, index) {
          if (index == userList.length) {
            return _selectUI();
          } else {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                      children: [
                         Row(
                      children: [
                        Text("Employee pk: "),
                        Text(userList[index]["emp_pk"].toString()),
                      ],
                    ),
                    SizedBox(width: 10,),
                        Row(
                          children: [
                            Text("Date: "),
                            Text(userList[index]["scheduledateddmm"].toString()),
                          ],
                        ),
                       
                      ],
                    ),
                    
                    
      
                    Row(
                      children: [
                        Text("intiming: " ),
                        Text(userList[index]["intiming"].toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text("outtiming: "),
                        Text(userList[index]["outtiming"].toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Employee Status: "),
                            Text(userList[index]["empstatus"].toString()),
                          ],
                        ),
      
                        Row(children: [
                          Text("Shift Code:"),
                          Text(userList[index]['shiftcode'].toString()),
                        ],)
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey, thickness: 1);
        },
      ),
    );
  }

  _selectUI() {
    return Center(child: CircularProgressIndicator(color: Colors.red));
  }
}
