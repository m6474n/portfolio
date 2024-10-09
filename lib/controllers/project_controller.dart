import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class ProjectController  extends GetxController{
final generalCont = Get.find<GeneralController>();
  List<Map<String,dynamic>> projects = [
    {
      'title': 'Project 1',
      'description': 'Project 1 is an innovative real estate platform designed to simplify the home buying and selling process.',
      'image': 'assets/images/portfolio1.jpg',
      'tech':[
        'Figma',
        'WordPress',
        'Elementor'
      ]
    },
     {
      'title': 'Project 2',
      'description': 'Project 2 is an innovative real estate platform designed to simplify the home buying and selling process.',
      'image': 'assets/images/portfolio3.jpg',
      'tech':[
        'Figma',
        'Next Js',
        'Tailwind',
        'ShadCN',
      ]
    }, {
      'title': 'Project 3',
      'description': 'Project 3 is an innovative real estate platform designed to simplify the home buying and selling process.',
      'image': 'assets/images/portfolio5.jpg',
      'tech':[
        'Figma',
        'WordPress',
        'Elementor'
      ]
    }
  ];


}