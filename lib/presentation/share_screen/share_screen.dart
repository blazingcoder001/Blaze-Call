import '../share_screen/widgets/gridrectangleseventeen_item_widget.dart';
import '../share_screen/widgets/gridrectangleten_item_widget.dart';
import 'controller/share_controller.dart';
import 'models/gridrectangleseventeen_item_model.dart';
import 'models/gridrectangleten_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class ShareScreen extends GetWidget<ShareController> {
  @override
  Widget build(BuildContext context) {
    print("share_screen.dart called");
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 6, right: 16, bottom: 6),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 3),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowleft,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(top: 3, bottom: 1),
                                    onTap: () {
                                      onTapImgArrowleft();
                                    }),
                                Obx(() => CustomCheckbox(
                                    width: getHorizontalSize(257),
                                    text: "lbl_4_selected".tr,
                                    value: controller.isCheckbox.value,
                                    fontStyle:
                                        CheckboxFontStyle.GilroySemiBold24,
                                    isRightCheck: true,
                                    onChange: (value) {
                                      controller.isCheckbox.value = value;
                                    }))
                              ])),
                      Padding(
                          padding: getPadding(top: 38),
                          child: Text("lbl_recent".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: getSize(130),
                                    width: getSize(130),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle10130x1301,
                                              height: getSize(130),
                                              width: getSize(130),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getSize(130),
                                                  width: getSize(130),
                                                  padding: getPadding(all: 45),
                                                  decoration: AppDecoration
                                                      .fillBlack9004c,
                                                  child: Stack(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgCheckmark40x40,
                                                        height: getSize(40),
                                                        width: getSize(40),
                                                        alignment:
                                                            Alignment.center)
                                                  ])))
                                        ])),
                                Container(
                                    height: getSize(130),
                                    width: getSize(130),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle11130x1301,
                                              height: getSize(130),
                                              width: getSize(130),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getSize(130),
                                                  width: getSize(130),
                                                  padding: getPadding(all: 45),
                                                  decoration: AppDecoration
                                                      .fillBlack9004c,
                                                  child: Stack(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgCheckmark40x40,
                                                        height: getSize(40),
                                                        width: getSize(40),
                                                        alignment:
                                                            Alignment.center)
                                                  ])))
                                        ])),
                                Container(
                                    height: getSize(130),
                                    width: getSize(130),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgRectangle12130x1301,
                                              height: getSize(130),
                                              width: getSize(130),
                                              alignment: Alignment.center),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getSize(130),
                                                  width: getSize(130),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVideocamera,
                                                            height: getSize(24),
                                                            width: getSize(24),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 4)),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                height: getSize(
                                                                    130),
                                                                width: getSize(
                                                                    130),
                                                                padding:
                                                                    getPadding(
                                                                        all:
                                                                            45),
                                                                decoration:
                                                                    AppDecoration
                                                                        .fillBlack9004c,
                                                                child: Stack(
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgCheckmark40x40,
                                                                          height: getSize(
                                                                              40),
                                                                          width: getSize(
                                                                              40),
                                                                          alignment:
                                                                              Alignment.center)
                                                                    ])))
                                                      ])))
                                        ]))
                              ])),
                      Padding(
                          padding: getPadding(top: 19),
                          child: Text("lbl_last_week".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(131),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: getHorizontalSize(3),
                                      crossAxisSpacing: getHorizontalSize(3)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.shareModelObj.value
                                  .gridrectangletenItemList.value.length,
                              itemBuilder: (context, index) {
                                GridrectangletenItemModel model = controller
                                    .shareModelObj
                                    .value
                                    .gridrectangletenItemList
                                    .value[index];
                                return GridrectangletenItemWidget(model);
                              }))),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Text("lbl_july_2022".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroySemiBold18)),
                      Padding(
                          padding: getPadding(top: 9),
                          child: Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(131),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: getHorizontalSize(3),
                                      crossAxisSpacing: getHorizontalSize(3)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.shareModelObj.value
                                  .gridrectangleseventeenItemList.value.length,
                              itemBuilder: (context, index) {
                                GridrectangleseventeenItemModel model =
                                    controller
                                        .shareModelObj
                                        .value
                                        .gridrectangleseventeenItemList
                                        .value[index];
                                return GridrectangleseventeenItemWidget(model);
                              })))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
