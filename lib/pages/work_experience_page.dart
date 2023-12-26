import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkExperiencePage extends StatelessWidget {
  final String facebookLink = "https://www.facebook.com/profile.php?id=100086029945847";
  final String twitterLink = "Your Twitter Link";
  final String instagramLink = "Your Instagram Link";
  final String linkedInLink = "Your LinkedIn Link";
  final String githubLink = "Your GitHub Link";

  Widget buildClickableSocialMediaIcon(IconData icon, String link) {
    return GestureDetector(
      onTap: () {
        // Add the link handling here
      },
      child: FaIcon(
        icon,
        size: 40,
        color: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Header
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontFamily: 'FontAwesome',
              ),
            ),
            SizedBox(height: 20),

            // Photo with frame
            Container(
              padding: EdgeInsets.only(bottom: 16.0),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 4.0,
                ),
                image: DecorationImage(
                  image: AssetImage('images/malek.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Paragraph
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Malek Ben Ayedi',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Étudiant en 3ème année de licence en technologie de l\'informatique (développement des systèmes informatiques) à l\'Institut Supérieur des Études Technologiques de Sfax (ISET SFAX).',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      'Je suis dynamique, favorisant le travail en groupe pour développer constamment mes compétences et grandir professionnellement.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Additional Info
                  buildInfoRow(FontAwesomeIcons.birthdayCake, 'Date of Birth: 13/10/2002'),
                  buildInfoRow(FontAwesomeIcons.mapMarkerAlt, 'Address:Mahres,Sfax'),
                  buildInfoRow(FontAwesomeIcons.envelope, 'Email: malekayadi01@gmail.com'),
                  buildInfoRow(FontAwesomeIcons.phone, 'Phone:+216 22 158 003'),

                  SizedBox(height: 20),
                ],
              ),
            ),

            // Title before the footer
            Text(
              'Liens sociaux',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 10),

            // Footer with social media icons
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildClickableSocialMediaIcon(FontAwesomeIcons.facebook, facebookLink),
                SizedBox(width: 10),
                buildClickableSocialMediaIcon(FontAwesomeIcons.twitter, twitterLink),
                SizedBox(width: 10),
                buildClickableSocialMediaIcon(FontAwesomeIcons.instagram, instagramLink),
                SizedBox(width: 10),
                buildClickableSocialMediaIcon(FontAwesomeIcons.linkedin, linkedInLink),
                SizedBox(width: 10),
                buildClickableSocialMediaIcon(FontAwesomeIcons.github, githubLink),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(
          icon,
          size: 20,
          color: Colors.lightBlue,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
