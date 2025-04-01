import 'dart:io';

import 'package:apk_installer/apk_installer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Dio dio = Dio();
  ValueNotifier downloadProgressNotifier = ValueNotifier(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      getVersion(context);
    }
  }

    Future<void> getVersion(BuildContext context) async {
    var apkVersionUrl = "http://49.248.108.179:4094/Common_Services.svc/getApkVersion";
    print("Version URL :: $apkVersionUrl");
    final response = await dio.get(apkVersionUrl);
    print("databse version  :$response");

    String databaseApkversion =
        response.data['GetAPKVersionResult']['APKVersion'];
    String dbLink = response.data['GetAPKVersionResult']['Link'];

    print("databaseApkVersion   $databaseApkversion");
    print("link   $dbLink");

    String platformVersion;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = packageInfo.version;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    int databaseVersion = int.parse(databaseApkversion);
    int apkVersion = int.parse(platformVersion);

    print("apkVersion from mobile app is  $apkVersion");
    print("databaseVersion from API is  $databaseVersion");
    // correct condition
    //when update apk version from must be 7 and app version from android must be 8
    //from db change it to 7
    //need to change apk version from build gradle file to 8
          
    if (databaseVersion > apkVersion) {
      //conditions for database version is greater
      print("greater");
      showUpdateDialohg(context, dbLink);

      // showVersionDialog(context, dbLink);
    }
    print(platformVersion);
  }

  showUpdateDialohg(BuildContext context, String dbLink) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (context) {
        return AlertDialog(
          actions: [
            //if(downloadProgressNotifier.value != 100.00)
            ElevatedButton(
                onPressed: () {
                  downloadFileFromServer(
                    context,
                    dbLink,
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 35),
                    backgroundColor: Colors.amberAccent),
                child: Text("Download")),
            // if(downloadProgressNotifier.value == 100.00)
            // ElevatedButton(onPressed: () {}, child: Text('INSTALL'))
          ],
          title: Text("New Update Available!"),
          content: SizedBox(
            // height: 200,
            width: 300,
            child: ValueListenableBuilder(
              valueListenable: downloadProgressNotifier,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 45.0,
                      barRadius: Radius.circular(10),
                      percent: downloadProgressNotifier.value / 100,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${downloadProgressNotifier.value}%',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  downloadFileFromServer(BuildContext cont, String link) async {
    try {
      downloadProgressNotifier.value = 0;
      Directory directory = await getApplicationDocumentsDirectory();

      Response rep = await Dio().download(link, '${directory.path}/App.apk',
          onReceiveProgress: (actualBytes, int totalBytes) {
        downloadProgressNotifier.value =
            (actualBytes / totalBytes * 100).floor();
      });
      print('File downloaded at ${directory.path}/App.apk');

      if (rep.statusCode == 200) {
        //file download
        Navigator.of(context).pop();
        installAppDialog('${directory.path}/App.apk', cont);
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Try After Some Time")));
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void installAppDialog(String apkPath, BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.amberAccent,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
              content: SizedBox(
                height: 35,
                width: 0,
                child: Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30)),
                      onPressed: () {
                        _installApk(apkPath);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "INSTALL",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ));
        });
  }

  Future<void> _installApk(String filePth) async {
    try {
      // Replace with the actual path to your APK file
      // String apkPath = "/storage/emulated/0/Download/your_app.apk";
      await ApkInstaller.installApk(filePath: filePth);
      print("APK installed successfully!");
    } catch (e) {
      print("Failed to install APK: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back to Home Screen'),
        ),
      ),
    );
  }
}
