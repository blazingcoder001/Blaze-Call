import '../controller/image_management_controller.dart';
import '../models/gridrectangle_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridrectangleItemWidget extends StatelessWidget {
  GridrectangleItemWidget(this.gridrectangleItemModelObj);

  GridrectangleItemModel gridrectangleItemModelObj;

  var controller = Get.find<ImageManagementController>();

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgRectangle10130x1304,
      height: getSize(
        130,
      ),
      width: getSize(
        130,
      ),
    );
  }
}
