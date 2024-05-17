import 'controller/video_call_controller.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_floating_button.dart';
import 'package:blaze_call/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends GetWidget<VideoCallController> {
  @override
  Widget build(BuildContext context) {
    print("video_call_screen.dart called");
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            body: Container(
                height: size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: getVerticalSize(129),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0.5, 0),
                                  end: Alignment(0.5, 1),
                                  colors: [
                                ColorConstant.black90033,
                                ColorConstant.black90033
                              ])))),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstant.imgRectangle20556x3961),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: double.maxFinite,
                                    child: Container(
                                        padding: getPadding(top: 5, bottom: 5),
                                        decoration: AppDecoration
                                            .gradientBlack9007fBlack90000,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomAppBar(
                                                  height: getVerticalSize(194),
                                                  leadingWidth: 40,
                                                  leading: AppbarImage(
                                                      height: getSize(24),
                                                      width: getSize(24),
                                                      svgPath: ImageConstant
                                                          .imgArrowleftWhiteA700,
                                                      margin: getMargin(
                                                          left: 16,
                                                          top: 7,
                                                          bottom: 11)),
                                                  title: Padding(
                                                      padding:
                                                          getPadding(left: 16),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    "lbl_angelyn_weiner"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtGilroySemiBold18WhiteA700)),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        right:
                                                                            94),
                                                                    child: Text(
                                                                        "lbl_20_23"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtPoppinsRegular14)))
                                                          ])))
                                            ]))),
                                Spacer(),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgRectangle1331200x120,
                                    height: getVerticalSize(200),
                                    width: getHorizontalSize(120),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(6)),
                                    alignment: Alignment.centerRight,
                                    margin: getMargin(right: 16))
                              ])))
                ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 27, right: 17, bottom: 50),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CustomIconButton(
                      height: 64,
                      width: 64,
                      child: CustomImageView(
                          svgPath: ImageConstant.imgVideocamera64x64)),
                  CustomIconButton(
                      height: 64,
                      width: 64,
                      margin: getMargin(left: 16),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgMicrophoneoutline)),
                  CustomIconButton(
                      height: 64,
                      width: 64,
                      margin: getMargin(left: 16),
                      variant: IconButtonVariant.OutlineBlack9004d_1,
                      child: CustomImageView(svgPath: ImageConstant.imgCall)),
                  CustomIconButton(
                      height: 64,
                      width: 64,
                      margin: getMargin(left: 16),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgVideocamera1))
                ])),
            floatingActionButton: CustomFloatingButton(
                height: 64,
                width: 64,
                child: CustomImageView(
                    svgPath: ImageConstant.imgGroup9759,
                    height: getVerticalSize(32.0),
                    width: getHorizontalSize(32.0)))));
  }
}
