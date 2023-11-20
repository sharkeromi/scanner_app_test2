import 'package:get/get.dart';
import 'package:scanner_app_test2/controller2.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {

    Get.put<ScannerController2>(ScannerController2());
  }
}
