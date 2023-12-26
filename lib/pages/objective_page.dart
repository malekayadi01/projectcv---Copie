import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: ObjectivePage(),
  ));
}

class ObjectivePage extends StatefulWidget {
  @override
  _ObjectivePageState createState() => _ObjectivePageState();
}

class ObjectiveItem {
  final String text;
  final String imagePath;

  ObjectiveItem(this.text, this.imagePath);
}

class _ObjectivePageState extends State<ObjectivePage> {
  final List<ObjectiveItem> objectives = [
    ObjectiveItem(
      'Stage de Perfectionnement : Piximind Application (PixiAuth : React-ts ,Nest-js,Docker,Keycloack, Micro-Service,Gateway)',
      'images/logo1.png',
    ),
    ObjectiveItem(
      'Stage de Initialisation : GCT Service informatique : Maintenance',
      'images/GCT.jpg',
    ),
    ObjectiveItem(
      'Projet Académique : Application E-Commerce Langages: React-js/Node-js/Mango DB',
      'images/e-commerce.png',
    ),
    ObjectiveItem(
      'Projet Académique : Application pour une agence de design graphique Langages: React-js/Django',
      'images/design.jpg',
    ),
    ObjectiveItem(
      'Projet Académique : Application Cv Langages: Flutter',
      'images/cv.png',
    ),
  ];

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: CarouselSlider.builder(
            itemCount: objectives.length,
            itemBuilder: (context, index, realIndex) {
              return _buildObjectiveItem(index);
            },
            options: CarouselOptions(
              height: 600,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildObjectiveItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                objectives[index].imagePath,
                height: 100,
                width: 100,
              ),
              SizedBox(height: 16),
              Text(
                objectives[index].text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
