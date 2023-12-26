import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0), // Adjust the top padding
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Adjust vertical padding
          children: [
            _buildListItem(
              icon: Icons.school,
              text: '2018-2021 : LYCÉE ALI BOURGIBA MAHRES ,               Bac Math',
              imageAsset: 'images/labm.png',
            ),
            _buildListItem(
              icon: Icons.school,
              text: '2023- PRÉSENT : INSTITUT SUPÉRIEUR DES ETUDES TECHNOLOGIQUES DE SFAX',
              imageAsset: 'images/iset.jpg',
            ),

            _buildListItem(
              icon: Icons.school,
              text: 'Formation React Js ',
              imageAsset: 'images/pixi.png',
            ),
            _buildListItem(
              icon: Icons.school,
              text: 'Formation Nest Js ',
              imageAsset: 'images/pixi.png',
            ),
            _buildListItem(
              icon: Icons.school,
              text: 'Formation Full Stack Js',
              imageAsset: 'images/go.png',
            ),
            _buildListItem(
              icon: Icons.school,
              text: 'Formation Git / Git Hub',
              imageAsset: 'images/go.png',
            ),
            _buildListItem(
              icon: Icons.school,
              text: 'Formation Html Css Js',
              imageAsset: 'images/go.png',
            ),
            //
            // Add more items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({required IconData icon, required String text, required String imageAsset}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 16.0), // Adjust spacing between each item
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust horizontal padding
        leading: Icon(icon),
        title: Text(text),
        trailing: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imageAsset),
        ),
        onTap: () {
          // Add your onTap logic here
        },
      ),
    );
  }
}
