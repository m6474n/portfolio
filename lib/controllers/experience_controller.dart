import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class ExperienceController extends GetxController{
final generalCont = Get.find<GeneralController>();
 List<Map<String,dynamic>> experienceList = [
  {
    'time': 'Jan 2024 - Present',
    'experience' : [
      {
        'role': 'Flutter Developer',
        'company': 'Twinspider Technologies.',
        'address': ''

      },
      {
        'role': 'WordPress Developer',
        'company': 'Twinspider Technologies.',
        'address': ''

      },
    ]
  },
  {
    'time': 'Apr 2022 - Present',
    'experience' : [
      {
        'role': 'Graphic Designer',
        'company': 'Fiverr.',
        'address': ''

      },
      {
        'role': 'WordPress Developer',
        'company': 'Fiverr.',
        'address': ''

      },
    ]
  }

 ]; 

List<Map<String,dynamic>> education = [
  {
    'time': 'Sep 2019 - Aug 2023',
    'experience' : [
      {
        'role': 'BS Hons. Information Technology',
        'company': 'National College of Business Administration & Economics,',
        'address': '(with 3.7 CGPA).'

      },
     
    ]
  },
  {
    'time': 'Aug 2016 - Jul 2019',
    'experience' : [
       {
        'role': 'DAE Instrumentation Technology',
        'company': 'Government Swedish Pakistani College of Technology,',
        'address': '(with 81%).'

      },
     
    ]
  },

 ]; 



}