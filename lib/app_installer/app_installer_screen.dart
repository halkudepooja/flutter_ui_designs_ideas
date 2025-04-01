import 'dart:io';

import 'package:apk_installer/apk_installer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class APK_Install extends StatefulWidget {
  const APK_Install({super.key});

  @override
  State<APK_Install> createState() => _APK_InstallState();
}

class _APK_InstallState extends State<APK_Install> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      child: Center(
        child: ElevatedButton(
          onPressed: _installApk,
          child: Text('Install APK'),
        ),
      ),
    ));
  }

  Future<void> _installApk() async {
    Directory directory = await getApplicationDocumentsDirectory();

    await ApkInstaller.installApk(filePath: '${directory.path}/Pravin.apk');
  }
}
