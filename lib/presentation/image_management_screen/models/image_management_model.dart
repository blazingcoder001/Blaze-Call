import 'package:get/get.dart';
import 'gridrectangle_item_model.dart';

class ImageManagementModel {
  Rx<List<GridrectangleItemModel>> gridrectangleItemList =
      Rx(List.generate(15, (index) => GridrectangleItemModel()));
}
