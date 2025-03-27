import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_design_ideas/IModelDelegate.dart';
import 'package:searchfield/searchfield.dart';
import 'package:textfield_search/textfield_search.dart';

class SelectEmpName extends StatefulWidget {
  const SelectEmpName({super.key});

  @override
  State<SelectEmpName> createState() => _SelectEmpNameState();
}

class _SelectEmpNameState extends State<SelectEmpName> {
  Dio dio = Dio();
  List emplist = [];
  bool isLoading = false;
  var searchEmpData;
  var searchController = TextEditingController();
  var textsearchController = TextEditingController();
  static String empCode_txt = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmpList();
  }

  Future<void> getEmpList() async {
    setState(() {
      isLoading = true;
    });
    final response = await dio.get(Imodeldelegate.searchEmpNameUrl);
    print("Search emp url::${Imodeldelegate.searchEmpNameUrl}");
    if (response.statusCode == 200) {
      List tList = [];
      for (int i = 0;
          i <
              response
                  .data['AutoCompleteData_AttendanceApplicationResult'].length;
          i++) {
        tList.add(
          response.data['AutoCompleteData_AttendanceApplicationResult'][i],
        );
      }
      print(response.toString());
      setState(() {
        isLoading = false;
        var data = json.decode(response.toString());

        emplist.addAll(tList);
        print(data["AutoCompleteData_AttendanceApplicationResult"]);
        searchEmpData =
            (data["AutoCompleteData_AttendanceApplicationResult"] ?? "");
        print("AutoCompleteData_AttendanceApplicationResult::$searchEmpData");
      });
    } else {
      print("No record found...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SEARCH FIELD DEMO", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            SearchField(
              searchInputDecoration: SearchInputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: Icon(Icons.search, color: Colors.black, size: 30),
                labelText: "Search Employee Name",
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              suggestionState: Suggestion.expand,
              controller: searchController,
              suggestionAction: SuggestionAction.next,
              enabled: true,
              suggestions: emplist.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              maxSuggestionsInViewPort: 5,
              itemHeight: 45,
              onSuggestionTap: (value) {
                String selecttedEmp = value.searchKey;
                searchController.text = selecttedEmp;
                List<String> splitEmpname = selecttedEmp.split(':');
                empCode_txt = splitEmpname[0].trim();
                print("Selected Employee Name::$empCode_txt");
                FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Selected Employee Code::$empCode_txt"),
            SizedBox(
              height: 20,
            ),
            TextFieldSearch(
              label: "Search Name",
              controller: textsearchController,
              future:(){
                return Future.value(emplist);
              },
              initialList: emplist,
              
autoClear: true,            
              getSelectedValue: (value) {
                print(value);
                // String selecttedEmp = value.searchKey;
                // textsearchController.text = selecttedEmp;
                // List<String> splitEmpname = selecttedEmp.split(':');
                // empCode_txt = splitEmpname[0].trim();
                // print("Selected Employee Name::$empCode_txt");
                // FocusScope.of(context).unfocus();
              },
            )
          ],
        ),
      ),
    );
  }
}
