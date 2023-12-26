import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'package:path_provider/path_provider.dart';

import '../main.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Future<String> _getLocalImagePath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  return '$appDocPath/malek.jpg';
}

Future<void> _saveImageLocally() async {
  String localImagePath = await _getLocalImagePath();
  ByteData data = await rootBundle.load('images/malek.jpg');
  List<int> bytes = data.buffer.asUint8List();
  await File(localImagePath).writeAsBytes(bytes);
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx) => ResumePage(updatePageTitle: (String ) {  },)),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    _saveImageLocally();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 100, // Adjust the radius based on your design
              backgroundImage: AssetImage("images/malek.jpg"),
            ),
            SizedBox(
              height: 50,
            ),

            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(), // Replaced SpinKitFadingCircle with a built-in widget
          ],
        ),
      ),
    );
  }
}
