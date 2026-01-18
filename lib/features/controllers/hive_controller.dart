import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveController extends GetxController{
  late final box;
  bool? welcome=MyHive.getNewValue(key: "welcome");
  bool? userTier=MyHive.getNewValue(key: "userTier");
  @override
  void onInit() {
    if(welcome==null){
      MyHive.setNewValue(key: "welcome",value: false);
      MyHive.setNewValue(key: "userTier",value: false);
    }

    super.onInit();

  }
}
class MyHive{
  static final box=Hive.box("userInfo");
  static void setNewValue({required String key,required dynamic value}){
    box.put(key,value);
  }
  static dynamic getNewValue({required String key}){
    return box.get(key,defaultValue:null);
  }

}