import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController text_login = new TextEditingController();
TextEditingController password = new TextEditingController();


class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Inscription Page'),),
      body: Column(
          children: [
            Container(
              padding:EdgeInsets.all(10),
              child:TextFormField(
                controller: text_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText:"id",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),

                  ),
                ),

              ),
            ),
            Container(
              padding:EdgeInsets.all(10),
              child:TextFormField(
                controller: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText:"password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),

                  ),
                ),

              ),
            ),

            Container(
              padding:EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size.fromHeight(50)
                ), onPressed: () {
                  _onInscrire(context);
              },
                child: Text('Inscription',style: TextStyle(fontSize: 22),),
              ),

            ),
            TextButton(
              child: Text("i already have an account",
                  style: TextStyle(fontSize: 22)),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/authentification');
              }),

          ],
      ),
    );
  }
  Future<void> _onInscrire(BuildContext context) async{
    prefs = await SharedPreferences.getInstance();
    if (!text_login.text.isEmpty && !password.text.isEmpty){
      prefs.setString("login", text_login.text);
      prefs.setString("password", password.text);
      prefs.setBool("connected", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');


    }else{
      const snackBar = SnackBar(content: Text('u did leave something empty'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}



