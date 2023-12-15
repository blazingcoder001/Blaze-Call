import 'package:blaze_call/core/utils/CreateAccountEmail.dart';
import 'package:blaze_call/core/utils/CheckUserName.dart';
import 'package:blaze_call/core/utils/SaveUserName.dart';
import 'package:blaze_call/core/utils/emailSignup.dart';

import 'controller/sign_up_controller.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/validation_functions.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_button.dart';
import 'package:blaze_call/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int signUpResult;
  late int usernameCheck;
  late int createAccount;
  late int usernameSave;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(42),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, bottom: 4),
                    onTap: () {
                      onTapArrowleft9();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_sign_up".tr)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 36, right: 16, bottom: 36),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("msg_create_your_account".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyBold24),
                          Padding(
                              padding: getPadding(top: 31),
                              child: Text("lbl_first_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.group10198Controller,
                              hintText: "msg_enter_first_name".tr,
                              margin: getMargin(top: 8),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("lbl_last_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.group10198OneController,
                              hintText: "lbl_enter_last_name".tr,
                              margin: getMargin(top: 7),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("lbl_email_id".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.group10198TwoController,
                              hintText: "lbl_enter_email_id".tr,
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("lbl_username".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.group10198ThreeController,
                              hintText: "lbl_enter_username".tr,
                              margin: getMargin(top: 8),
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (!isValidPhone(value)) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          Obx(() => CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.group10198FourController,
                              hintText: "lbl_enter_password".tr,
                              margin: getMargin(top: 7),
                              padding: TextFormFieldPadding.PaddingT12,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(all: 12),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword.value)),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "lbl_create_account".tr,
                              margin: getMargin(top: 24, bottom: 5),
                              padding: ButtonPadding.PaddingAll14,
                              fontStyle: ButtonFontStyle.GilroyMedium16,
                          onTap: () async {
                                print("controller3 value:"+controller.group10198ThreeController.text);
                            usernameCheck = (
                                await checkUserName(
                                controller.group10198ThreeController.text))!;
                            print("value of usernamecheck:"+usernameCheck.toString());
                                if(usernameCheck==1) {
                                  createAccount= await createAccountEmail(controller.group10198TwoController.text, controller.group10198FourController.text);
                                  print("Value of create Account:"+createAccount.toString());
                                  if (createAccount == 1) {

                                    signUpResult = await emailSignup(
                                        controller.group10198Controller.text,
                                        controller.group10198OneController.text,
                                        controller.group10198TwoController.text,
                                        controller.group10198ThreeController
                                            .text
                                    );
                                    usernameSave= (await saveUserName(controller.group10198ThreeController.text, "email"))!;
                                    if(usernameSave==1){
                                      print("Username saved successfully!");
                                    }
                                    else if (usernameSave==0){
                                      print("Some Error Occurred");
                                    }

                                  }
                                  else if(createAccount==0) {
                                    print("Account already exists for this email.");
                                  }
                                }
                                else if (usernameCheck==0) {
                                  print("Username already taken! Please try another one.");
                                }
                                else if(usernameCheck==2){
                                  print("Some error occurred!");
                                }
                          }
                              )
                        ]
                    )
                )
            )
        )
    );
  }

  onTapArrowleft9() {
    Get.back();
  }
}
