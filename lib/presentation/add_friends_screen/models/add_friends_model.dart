import 'package:get/get.dart';
import 'addfriends_item_model.dart';

class AddFriendsModel {
  Rx<List<AddfriendsItemModel>> addfriendsItemList =
      Rx(List.generate(6, (index) => AddfriendsItemModel()));
}
