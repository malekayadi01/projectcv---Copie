import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        title: 'Flutter Theme Toggle',
        theme: Provider.of<ThemeProvider>(context).getTheme(),
        home: ActivitiesPage(),
      ),
    );
  }
}

class ActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        title: ElevatedButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5),
              Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.nights_stay // Moon icon for dark mode
                    : Icons.wb_sunny, // Sun icon for light mode
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Make a Phone Call'),
              onTap: () {
                _makePhoneCall('+216 22158003');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Send an Email'),
              onTap: () {
                _sendEmail('malekayadi01@gmail.com');
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Open Location in App'),
              onTap: () {
                _openLocationInApp(
                    context, 34.533680, 10.506570); // Pass the context
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to make a phone call
  _makePhoneCall(String phoneNumber) async {
    try {
      await launch('tel:$phoneNumber');
    } catch (e) {
      print('Error launching phone call: $e');
    }
  }

  // Function to send an email
  _sendEmail(String emailAddress) async {
    String url = 'mailto:$emailAddress?subject=Subject%20of%20the%20email';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  // Function to open the location in a map app using maps_launcher
  _openLocationInApp(
      BuildContext context, double latitude, double longitude) {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }
}
