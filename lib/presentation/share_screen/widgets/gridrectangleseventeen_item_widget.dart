import '../controller/share_controller.dart';
import '../models/gridrectangleseventeen_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridrectangleseventeenItemWidget extends StatelessWidget {
  GridrectangleseventeenItemWidget(this.gridrectangleseventeenItemModelObj);

  GridrectangleseventeenItemModel gridrectangleseventeenItemModelObj;

  var controller = Get.find<ShareController>();

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgRectangle16130x1301,
      height: getSize(
        130,
      ),
      width: getSize(
        130,
      ),
    );
  }
}
