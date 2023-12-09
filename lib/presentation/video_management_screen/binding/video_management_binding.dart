import '../controller/video_management_controller.dart';
import 'package:get/get.dart';

class VideoManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoManagementController());
  }
}
