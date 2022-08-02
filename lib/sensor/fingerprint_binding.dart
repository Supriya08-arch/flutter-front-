import 'package:get/instance_manager.dart';
import 'package:getx/sensor/fingerprint_controller.dart';

class FingerPrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FingerPrintController>(() => FingerPrintController());
  }
}
