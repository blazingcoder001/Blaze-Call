import '../image_management_screen/widgets/gridrectangle_item_widget.dart';
import 'controller/image_management_controller.dart';
import 'models/gridrectangle_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ImageManagementScreen extends GetWidget<ImageManagementController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 12, bottom: 14)),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_nature".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgOverflowmenu1,
                      margin:
                          getMargin(left: 16, top: 12, right: 16, bottom: 14))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, right: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 23),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgProfileimglarge72x72,
                                    height: getSize(72),
                                    width: getSize(72),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(36)),
                                    margin: getMargin(left: 150))
                              ])),
                      Container(
                          height: getVerticalSize(52),
                          width: getHorizontalSize(396),
                          margin: getMargin(top: 24),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    padding: getPadding(
                                        left: 73,
                                        top: 15,
                                        right: 73,
                                        bottom: 15),
                                    decoration:
                                        AppDecoration.outlineBluegray100,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_recent".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroyMedium16Bluegray400)
                                        ]))),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: getPadding(left: 76),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_top".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtGilroyMedium16BlueA700),
                                          Padding(
                                              padding: getPadding(top: 16),
                                              child: SizedBox(
                                                  width: getHorizontalSize(47),
                                                  child: Divider(
                                                      height:
                                                          getVerticalSize(2),
                                                      thickness:
                                                          getVerticalSize(2),
                                                      color: ColorConstant
                                                          .blueA700)))
                                        ])))
                          ])),
                      Padding(
                          padding: getPadding(top: 22),
                          child: Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(131),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: getHorizontalSize(3),
                                      crossAxisSpacing: getHorizontalSize(3)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.imageManagementModelObj
                                  .value.gridrectangleItemList.value.length,
                              itemBuilder: (context, index) {
                                GridrectangleItemModel model = controller
                                    .imageManagementModelObj
                                    .value
                                    .gridrectangleItemList
                                    .value[index];
                                return GridrectangleItemWidget(model);
                              })))
                    ]))));
  }
}
