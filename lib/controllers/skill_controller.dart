import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class SkillController extends GetxController {
  final generalCont = Get.find<GeneralController>();
  List<Map<String, dynamic>> skills = [
    {'title': 'HTML', 'icon': '../../assets/images/skills/html.svg'},
    {'title': 'CSS', 'icon': '../../assets/images/skills/css.svg'},
    {'title': 'Javascript', 'icon': '../../assets/images/skills/node.svg'},
    {'title': 'React JS', 'icon': '../../assets/images/skills/react.svg'},
    {'title': 'Bootstrap', 'icon': '../../assets/images/skills/bootstrap.svg'},
    {'title': 'Next JS', 'icon': '../../assets/images/skills/next.svg'},
    {'title': 'Tailwind', 'icon': '../../assets/images/skills/tailwind.svg'},
    {'title': 'Ruby', 'icon': '../../assets/images/skills/ruby.svg'},
    {'title': 'Rails', 'icon': '../../assets/images/skills/rails.svg'},
    {'title': 'Postgresql', 'icon': '../../assets/images/skills/postgres.svg'},
    {'title': 'MongoDB', 'icon': '../../assets/images/skills/mongo.svg'},
    {'title': 'SQLite', 'icon': '../../assets/images/skills/sqlite.svg'},
    {'title': 'Flutter', 'icon': '../../assets/images/skills/flutter.svg'},
    {'title': 'Firebase', 'icon': '../../assets/images/skills/firebase.svg'},
    {'title': 'Material UI', 'icon': '../../assets/images/skills/material.svg'},
    {'title': 'Figma', 'icon': '../../assets/images/skills/figma.svg'},

    {'title': 'Photoshop', 'icon': '../../assets/images/skills/photoshop.svg'},
    {'title': 'Illustrator', 'icon': '../../assets/images/skills/illustrator.svg'},
  ];
}
