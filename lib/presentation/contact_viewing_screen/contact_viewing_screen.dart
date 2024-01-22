import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';

import '../../widgets/custom_button.dart';
import 'controller/contact_viewing_controller.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/validation_functions.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ContactViewingScreen extends GetWidget<ContactViewingController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ContactListItemModel args= Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(48),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 13, bottom: 11),
                    onTap: () {
                      onTapArrowleft7();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_contact_details".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgShare,
                      margin:
                          getMargin(left: 16, top: 13, right: 16, bottom: 11))
                ]),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 14, right: 16, bottom: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // CustomImageView(
                          //     imagePath: ImageConstant.imgEllipse5150x150,
                          //     height: getSize(150),
                          //     width: getSize(150),
                          //     radius:
                          //         BorderRadius.circular(getHorizontalSize(75)),
                          //     alignment: Alignment.center),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,

                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  args.profilePicUrl!.value,
                                  height: getSize(100),
                                  width: getSize(100),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  errorBuilder: (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                                    return Text('Failed to load image');
                                  },
                                  loadingBuilder: (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child:  CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 15),
                                  child: Text(args.firstName!.value+" "+args.lastName!.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtGilroySemiBold18))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 15),
                                  child: Text(args.userName!.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtGilroyRegular16))),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "lbl_send_request".tr,
                              margin: getMargin(top: 24, bottom: 5),
                              padding: ButtonPadding.PaddingAll14,
                              fontStyle: ButtonFontStyle.GilroyMedium16,
                            onTap: (){

                            },



                          )
                          // Padding(
                          //     padding: getPadding(top: 76),
                          //     child: Text("lbl_mobile_number".tr,
                          //         overflow: TextOverflow.ellipsis,
                          //         textAlign: TextAlign.left,
                          //         style: AppStyle.txtGilroyRegular16)),
                          // Padding(
                          //     padding: getPadding(top: 13),
                          //     child: Row(children: [
                          //       Padding(
                          //           padding: getPadding(top: 1, bottom: 3),
                          //           child: Text("lbl_808_555_0111".tr,
                          //               overflow: TextOverflow.ellipsis,
                          //               textAlign: TextAlign.left,
                          //               style: AppStyle.txtGilroyMedium16)),
                          //       Spacer(),
                          //       CustomImageView(
                          //           svgPath: ImageConstant.imgCall,
                          //           height: getSize(24),
                          //           width: getSize(24)),
                          //       CustomImageView(
                          //           svgPath: ImageConstant.imgMenu,
                          //           height: getSize(24),
                          //           width: getSize(24),
                          //           margin: getMargin(left: 16))
                          //     ])),
                          // Padding(
                          //     padding: getPadding(top: 9),
                          //     child: Divider(
                          //         height: getVerticalSize(1),
                          //         thickness: getVerticalSize(1),
                          //         color: ColorConstant.blueGray100)),
                          // Padding(
                          //     padding: getPadding(top: 17),
                          //     child: Text("lbl_email".tr,
                          //         overflow: TextOverflow.ellipsis,
                          //         textAlign: TextAlign.left,
                          //         style: AppStyle.txtGilroyRegular16)),
                          // CustomTextFormField(
                          //     focusNode: FocusNode(),
                          //     controller: controller.emailOneController,
                          //     hintText: "msg_michellerock_gmail_com".tr,
                          //     margin: getMargin(top: 16),
                          //     variant:
                          //         TextFormFieldVariant.UnderLineBluegray100,
                          //     fontStyle: TextFormFieldFontStyle
                          //         .GilroyMedium16Bluegray900,
                          //     textInputType: TextInputType.emailAddress,
                          //     validator: (value) {
                          //       if (value == null ||
                          //           (!isValidEmail(value, isRequired: true))) {
                          //         return "Please enter valid email";
                          //       }
                          //       return null;
                          //     }),
                          // Padding(
                          //     padding: getPadding(top: 19),
                          //     child: Text("lbl_ringtone".tr,
                          //         overflow: TextOverflow.ellipsis,
                          //         textAlign: TextAlign.left,
                          //         style: AppStyle.txtGilroyRegular16)),
                          // CustomTextFormField(
                          //     focusNode: FocusNode(),
                          //     controller: controller.group3670Controller,
                          //     hintText: "msg_default_ringtone".tr,
                          //     margin: getMargin(top: 14, bottom: 5),
                          //     variant:
                          //         TextFormFieldVariant.UnderLineBluegray100,
                          //     fontStyle: TextFormFieldFontStyle
                          //         .GilroyMedium16Bluegray900,
                          //     textInputAction: TextInputAction.done)
                        ])))));
  }

  onTapArrowleft7() {
    Get.back();
  }
}
