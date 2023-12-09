import '../activity_feed_screen/widgets/listprofileimglarge_item_widget.dart';
import '../activity_feed_screen/widgets/listvideocamera_item_widget.dart';
import 'controller/activity_feed_controller.dart';
import 'models/listprofileimglarge_item_model.dart';
import 'models/listvideocamera_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ActivityFeedScreen extends GetWidget<ActivityFeedController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 13, bottom: 16),
                    onTap: () {
                      onTapArrowleft2();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_activity_feed".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 25, right: 16, bottom: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_today".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtGilroySemiBold18),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: controller.activityFeedModelObj.value
                                  .listprofileimglargeItemList.value.length,
                              itemBuilder: (context, index) {
                                ListprofileimglargeItemModel model = controller
                                    .activityFeedModelObj
                                    .value
                                    .listprofileimglargeItemList
                                    .value[index];
                                return ListprofileimglargeItemWidget(model);
                              }))),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Text("lbl_this_month".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: controller.activityFeedModelObj.value
                                  .listvideocameraItemList.value.length,
                              itemBuilder: (context, index) {
                                ListvideocameraItemModel model = controller
                                    .activityFeedModelObj
                                    .value
                                    .listvideocameraItemList
                                    .value[index];
                                return ListvideocameraItemWidget(model);
                              })))
                    ]))));
  }

  onTapArrowleft2() {
    Get.back();
  }
}
