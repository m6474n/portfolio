import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class ProjectController  extends GetxController{
  List<Map<String,dynamic>> projects = [
    {
      'title': 'Tailor Book',
      'link': 'https://github.com/m6474n',
      'description': 'Project 1 is an innovative real estate platform designed to simplify the home buying and selling process.',
      // 'image': 'assets/images/portfolio1.jpg',
      'image': 'assets/images/Next js Portfolio.png',
      'tech':[
        'Figma',
        'WordPress',
        'Elementor'
      ]
    },
     {
      'title': 'Food Connect',
      'link': 'https://github.com/m6474n',

      'description': 'Food Connect is a mobile app aimed at connecting restaurants, NGOs, and individuals to reduce food wastage and address hunger.',
      'image': 'assets/images/FoodConnect.png',
      'tech':[
        'Dart',
        'Flutter',
        'Firebase',
        'Google Map',
      ]
    }, {
      'title': 'Ai Notes Taking App',
      'link': 'https://github.com/m6474n',

      'description': 'An AI based Notes App that fetch answers from the uploaded PDF file.',
      'image': 'assets/images/ai-notes-taking-app.png',
      'tech':[
        'Next Js',
        'Convex',
        'Gemini'
      ]
    }
  ];


}