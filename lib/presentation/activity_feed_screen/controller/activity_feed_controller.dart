import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/activity_feed_screen/models/activity_feed_model.dart';

class ActivityFeedController extends GetxController {
  Rx<ActivityFeedModel> activityFeedModelObj = ActivityFeedModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
