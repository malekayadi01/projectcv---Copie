import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('JavaScipt', "images/f1.jpg", Colors.white),
                  itemDashboard('Dart', "images/f2.png", Colors.white),
                  itemDashboard('React Js', "images/l3.png", Colors.white),
                  itemDashboard('Angular', "images/l4.png", Colors.white),
                  itemDashboard('Java', "images/l5.png", Colors.white),
                  itemDashboard('Spring Boot', "images/l6.png", Colors.white),
                  itemDashboard('Node js', "images/l7.png", Colors.white),
                  itemDashboard('Nest js', "images/l8.png", Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // You can add more widgets related to PersonalInfoPage below
        ],
      ),
    );
  }

  Widget itemDashboard(String title, String imagePath, Color background) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 8),
            // Add text below the photo with black color
            Text(
              title.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
}
