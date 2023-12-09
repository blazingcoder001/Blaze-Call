import 'controller/video_management_controller.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class VideoManagementScreen extends GetWidget<VideoManagementController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(53),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 17),
                    onTap: () {
                      onTapArrowleft6();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_trending_videos".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgOverflowmenu1,
                      margin:
                          getMargin(left: 16, top: 12, right: 16, bottom: 17))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 20, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: CustomSearchView(
                              focusNode: FocusNode(),
                              controller: controller.inputFieldController,
                              hintText: "lbl_search_videos".tr,
                              margin: getMargin(left: 16, right: 16),
                              alignment: Alignment.center,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 12, top: 12, right: 8, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgSearch)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)),
                              suffix: Container(
                                  margin: getMargin(
                                      left: 30, top: 12, right: 12, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgMicrophone)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)))),
                      Padding(
                          padding: getPadding(left: 16, top: 29),
                          child: Text("lbl_trending_now".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: getPadding(left: 16, top: 9),
                          child: IntrinsicWidth(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgMovieposter29,
                                    height: getVerticalSize(150),
                                    width: getHorizontalSize(300)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMovieposter29150x300,
                                    height: getVerticalSize(150),
                                    width: getHorizontalSize(300),
                                    margin: getMargin(left: 16))
                              ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 29),
                          child: Text("msg_top_10_web_shows".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: getPadding(left: 16, top: 9),
                          child: IntrinsicWidth(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgMovieposter33,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgMovieposter34,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgMovieposter35,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgMovieposter36,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8))
                              ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 29),
                          child: Text("lbl_top_10_movies".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: getPadding(left: 16, top: 9, bottom: 5),
                          child: IntrinsicWidth(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMovieposter33160x110,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMovieposter34160x110,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMovieposter35160x110,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgMovieposter36160x110,
                                    height: getVerticalSize(160),
                                    width: getHorizontalSize(110),
                                    margin: getMargin(left: 8))
                              ])))
                    ]))));
  }

  onTapArrowleft6() {
    Get.back();
  }
}
