import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/preview_video_screen/models/preview_video_model.dart';
import 'package:blaze_call/widgets/custom_bottom_bar.dart';

class PreviewVideoController extends GetxController {
  Rx<PreviewVideoModel> previewVideoModelObj = PreviewVideoModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
