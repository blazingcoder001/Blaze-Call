import '../controller/image_management_controller.dart';
import 'package:get/get.dart';

class ImageManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageManagementController());
  }
}
