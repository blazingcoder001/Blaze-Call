import 'package:get/get.dart';
import 'followers_item_model.dart';

class FollowersModel {
  Rx<List<FollowersItemModel>> followersItemList =
      Rx(List.generate(11, (index) => FollowersItemModel()));
}
