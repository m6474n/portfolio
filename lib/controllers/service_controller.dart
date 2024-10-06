import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class ServiceController extends GetxController {
  List<Map<String, dynamic>> services = [
    {
      'icon': HugeIcons.strokeRoundedCompass01 ,
      'title': "Digital Experience Design",
      'description':
          "Crafting visually stunning and user-friendly websites that not only captivate your audience but also drive engagement. Our design philosophy blends aesthetics with functionality to deliver seamless digital experiences",
      'tech': [
        'WordPress',
        'Elementor',
        'Divi',
        'React JS',
        'Bootstrap',
        'Next Js',
        'Tailwind',
        'ShadCN',
      ]
    },{
      'icon': HugeIcons.strokeRoundedWebDesign02 ,
      'title': "Custom Software Solutions",
      'description':
          "Elevate your business with our custom software solutions, designed to tackle unique challenges and streamline processes. Our expert developers deliver scalable, secure software that drives growth and innovation.",
      'tech': [
        'Node JS',
        'React JS',
        'Bootstrap',
        'Next Js',
        'Tailwind',
        'MongoDB',
        'PostgreSQL',
        'Ruby on Rails',
      ]
    },{
      'icon': HugeIcons.strokeRoundedMobileNavigator01 ,
      'title': "Cross Platform Applications",
      'description':
          "Expand your reach with our hybrid app development, crafting versatile, high-performance applications for seamless experiences on both iOS and Android devices.",
      'tech': [
        'Flutter',
        'Firebase',
        'SQFLite',
        'Material UI',
        'MongoDB',
        'Google Map',
        'Push Notifications',
        
      ]
    }
  ];
}