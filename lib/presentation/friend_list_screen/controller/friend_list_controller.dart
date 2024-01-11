import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/friend_list_model.dart';

class FriendListController extends GetxController {
  Rx<FriendListModel> friendListModelObj = FriendListModel().obs;
  Rx<int> selectedIndex=0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
