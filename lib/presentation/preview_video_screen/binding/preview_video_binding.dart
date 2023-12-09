import '../controller/preview_video_controller.dart';
import 'package:get/get.dart';

class PreviewVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreviewVideoController());
  }
}
