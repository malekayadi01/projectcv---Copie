import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              _Deconnexion(context);
            },
            child: Text('Deconnexion', style: TextStyle(fontSize: 22)),
          ),
        ),
      ),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connected", false);
    Navigator.pushNamedAndRemoveUntil(context, '/authentication', (route) => false);
  }
}
