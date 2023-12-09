import 'package:get/get.dart';
import 'listprofileimglarge_item_model.dart';
import 'listvideocamera_item_model.dart';

class ActivityFeedModel {
  Rx<List<ListprofileimglargeItemModel>> listprofileimglargeItemList =
      Rx(List.generate(2, (index) => ListprofileimglargeItemModel()));

  Rx<List<ListvideocameraItemModel>> listvideocameraItemList =
      Rx(List.generate(4, (index) => ListvideocameraItemModel()));
}
