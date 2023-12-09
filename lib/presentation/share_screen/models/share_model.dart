import 'package:get/get.dart';
import 'gridrectangleten_item_model.dart';
import 'gridrectangleseventeen_item_model.dart';

class ShareModel {
  Rx<List<GridrectangletenItemModel>> gridrectangletenItemList =
      Rx(List.generate(6, (index) => GridrectangletenItemModel()));

  Rx<List<GridrectangleseventeenItemModel>> gridrectangleseventeenItemList =
      Rx(List.generate(6, (index) => GridrectangleseventeenItemModel()));
}
