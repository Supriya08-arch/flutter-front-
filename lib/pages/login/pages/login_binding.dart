import 'package:get/instance_manager.dart';
import 'package:getx/pages/login/pages/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
