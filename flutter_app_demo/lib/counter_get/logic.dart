import 'package:get/get.dart';
///logic层
class CounterGetLogic extends GetxController {
  var count = 0;
  void increase(){
    ++count;
    update();
  }
}
