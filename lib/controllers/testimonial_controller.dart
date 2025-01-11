import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class TestimonialController extends GetxController {
PageController testimonialController = PageController();
int currentIndex = 0;


goNext(){
  if(currentIndex < testimonials.length){
    var  index=  currentIndex ;
      index ++;
    testimonialController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeInOut).then((v){
      
      currentIndex = index;
      update();
    });
  }
}
goBack(){
  if(currentIndex > 0){
    var  index= currentIndex;
    index --;
    testimonialController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeInOut).then((v){
        currentIndex = index;
      update();
    });
    // update();
  }
}

  List<Map<String, dynamic>> testimonials = [
    {
      'image': '',
      'client_name': 'Yusvarial',
      'client_country': 'Spain',
      'client_company': 'Trade Pro',
      'client_testimonials':
          'Great work from Mohsin, took care of the entire project that was not easy to do and did great. I will take more orders from him eventually, as he does his work with patience and great finishing! Nice work Muhammad, keep like that.'
    },
    {
      'image': '',
      'client_name': 'Abdullah',
      'client_country': 'United Kingdom',
      'client_company': 'AutoCrave',
      'client_testimonials':
          'Muhammad Mohsin is truly exceptional. Their work is consistently impressive, demonstrating a unique blend of creativity and expertise. A pleasure to collaborate with – reliable, efficient, and always exceeding expectations. Highly recommended.'
    },
    {
      'image': '',
      'client_name': 'Tobin Media',
      'client_country': 'Newzeland',
      'client_company': 'Station Pho',
      'client_testimonials':
          'Mohsin communicates well, and has a great eye for design, he is quick but professional.'
    },
    {
      'image': '',
      'client_name': 'Carne',
      'client_country': 'South Africa',
      'client_company': 'CarMaky',
      'client_testimonials':
          'Fantastic, Muhammad did a great job. Very happy with the service and will make use of him again.'
    },
    {
      'image': '',
      'client_name': 'Mehdi Hilali',
      'client_country': 'Spain',
      'client_company': 'Your Temporary Stay',
      'client_testimonials':
          'Working with Mohsin has been a fantastic experience. He helped me create a professional website that exceeded my expectations in terms of design, functionality, and attention to detail. From the start, they demonstrated a strong ability to understand my vision and turn it into an attractive and functional site. Communication was smooth, and he was always open to my suggestions, making the necessary adjustments along the way. He also delivered the project within the agreed timeframe and provided additional support after the project was completed. I highly recommend Mohsin to anyone looking for a dedicated professional with solid expertise and a personalized approach to web development. I will definitely work with them again in the future'
    },
    {
      'image': '',
      'client_name': 'Sintey',
      'client_country': 'Combodia',
      'client_company': 'Station Pho',
      'client_testimonials':
          'just amazing....this guy make everything looks perfect ....did more than i expected ...very good ...i will work with him only for future work.'
    },
    {
      'image': '',
      'client_name': 'Maida Malik',
      'client_country': 'Pakistan',
      'client_company': 'PakRishteNaate',
      'client_testimonials':
          'I recently had the pleasure of working with an incredibly talented and professional this web developer, and I must say that my experience exceeded all expectations. From start to finish, his expertise and dedication to delivering a top-notch website truly impressed me. His Delivery timing ,communication , work is excellent. Highly Recommended. Thank you so much Mohsin. You are incredibly talented.'
    },
    {
      'image': '',
      'client_name': 'Bharat Modani',
      'client_country': 'India',
      'client_company': 'Kamla Cashews',
      'client_testimonials':
          'Moshin has done the work very patiently and with utmost determination,Also he has been very helpful with my work and was ready to implement every change I say.I highly recommend him for all your design and website works'
    },
  ];


  @override
  void onInit() {
    // TODO: implement onInit
      testimonialController.addListener(() {
      currentIndex = testimonialController.page!.round();
      update();
    });
    super.onInit();
  }
}
