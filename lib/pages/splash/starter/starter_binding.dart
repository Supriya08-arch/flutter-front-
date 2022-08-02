import 'package:get/get.dart';
import 'package:getx/pages/splash/starter/starter_controller.dart';

class StarterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StarterController>(() => StarterController());
  }
}
