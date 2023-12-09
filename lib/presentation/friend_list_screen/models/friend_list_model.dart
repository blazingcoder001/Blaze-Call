import 'package:get/get.dart';
import 'friendlist_item_model.dart';

class FriendListModel {
  Rx<List<FriendlistItemModel>> friendlistItemList =
      Rx(List.generate(10, (index) => FriendlistItemModel()));
}
