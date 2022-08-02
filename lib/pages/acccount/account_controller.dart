// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:get/get.dart';

class AccountController extends GetxController {
  var counter = 0.obs;

  void increaseCounter() {
    counter.value += 1;
  }
}
