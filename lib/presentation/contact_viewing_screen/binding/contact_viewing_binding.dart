import '../controller/contact_viewing_controller.dart';
import 'package:get/get.dart';

class ContactViewingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactViewingController());
  }
}
