import 'package:get/get.dart';
import 'package:portfolio/components/socialIcon.dart';

class GeneralController  extends GetxController{

bool isButtonHover = false;

handleHover(val){
isButtonHover  = val;
update();
}

bool isSettingHover = false;
    
    onSettingHover(bool val){
isSettingHover = val;
update();
    }


}