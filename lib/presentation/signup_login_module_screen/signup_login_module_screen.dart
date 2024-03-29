import 'package:blaze_call/core/utils/authorization.dart';
import 'package:flutter/gestures.dart';
import 'controller/signup_login_module_controller.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/validation_functions.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_button.dart';
import 'package:blaze_call/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:blaze_call/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignupLoginModuleScreen extends GetWidget<SignupLoginModuleController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int check = 0;
  int isLoading=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () async{
            if(isLoading==0){
              return true;
            }
            else{
              return false;
            }
          },
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: ColorConstant.gray50,
              appBar: CustomAppBar(
                  height: getVerticalSize(55),
                  leadingWidth: 40,
                  leading: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgArrowleft,
                      margin: getMargin(left: 16, top: 14, bottom: 17),
                      onTap: () {
                        onTapArrowleft11();
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "lbl_email_sign_in".tr)),
              body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding:
                            getPadding(left: 15, top: 21, right: 15, bottom: 21),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 1),
                                  child: Text("lbl_email".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtGilroyMedium16)),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.group10198Controller,
                                  hintText: "msg_enter_your_email_or_username".tr,
                                  margin: getMargin(left: 1, top: 8),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      check = 1;
                                      return "lbl_invalid_email".tr;
                                    }
                                    return null;
                                  }),
                              Padding(
                                  padding: getPadding(left: 1, top: 18),
                                  child: Text("lbl_password".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtGilroyMedium16)),
                              Obx(() => CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.group10198OneController,
                                  hintText: "lbl_enter_password".tr,
                                  margin: getMargin(left: 1, top: 7),
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
                                      check = 1;
                                      return "lbl_invalid_password".tr;
                                    }
                                    return null;
                                  },
                                  isObscureText:
                                      controller.isShowPassword.value)),
                              Padding(
                                  padding: getPadding(left: 1, top: 9, right: 7),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Obx(() => CustomCheckbox(
                                        //     text: "lbl_remember_me".tr,
                                        //     value: controller.isCheckbox.value,
                                        //     fontStyle:
                                        //         CheckboxFontStyle.GilroyMedium14,
                                        //     onChange: (value) {
                                        //       controller.isCheckbox.value = value;
                                        //     })),
                                        Padding(
                                            padding: getPadding(top: 3),
                                            child: Text("msg_forgot_password".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtGilroyMedium14BlueA700))
                                      ])),
                              CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_sign_in".tr,
                                margin: getMargin(left: 1, top: 25),
                                padding: ButtonPadding.PaddingAll14,
                                fontStyle: ButtonFontStyle.GilroyMedium16,
                                onTap: () async {
                                  _formKey.currentState!.validate();
                                  int? result;
                                  if (check == 0) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      showDialog(
                                          context: context,
                                          barrierColor: null,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            isLoading=0;
                                            return FutureBuilder(
                                                future: controller.future1(
                                                    controller
                                                        .group10198Controller
                                                        .text,
                                                    controller
                                                        .group10198OneController
                                                        .text),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    if (snapshot.data == 1) {
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        Get.toNamed(AppRoutes
                                                            .contactListScreen);
                                                      });
                                                    }
                                                    Get.back();
                                                    return Container();
                                                  } else if (snapshot.hasError) {
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text('Error'),
                                                            content: Text(
                                                                '${snapshot.error}'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text('OK'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    });
                                                    Get.back();
                                                    return Container();
                                                  }
                                                  isLoading=1;

                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                });
                                          });
                                    });
                                  }
                                  check = 0;
                                  if (result == 1) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Get.toNamed(AppRoutes.contactListScreen);
                                    });
                                  }
                                },
                              ),
                              Padding(
                                  padding: getPadding(left: 1, top: 26, right: 1),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(top: 10, bottom: 7),
                                            child: SizedBox(
                                                width: getHorizontalSize(130),
                                                child: Divider(
                                                    height: getVerticalSize(1),
                                                    thickness: getVerticalSize(1),
                                                    color: ColorConstant
                                                        .blueGray200))),
                                        Text("msg_or_continue_with".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtGilroyRegular16Bluegray200),
                                        Padding(
                                            padding:
                                                getPadding(top: 10, bottom: 7),
                                            child: SizedBox(
                                                width: getHorizontalSize(129),
                                                child: Divider(
                                                    height: getVerticalSize(1),
                                                    thickness: getVerticalSize(1),
                                                    color: ColorConstant
                                                        .blueGray200)))
                                      ])),
                              CustomButton(
                                  height: getVerticalSize(50),
                                  text: "msg_sign_in_with_google".tr,
                                  margin: getMargin(left: 2, top: 28),
                                  variant: ButtonVariant.OutlineBlueA700,
                                  padding: ButtonPadding.PaddingT14,
                                  fontStyle:
                                      ButtonFontStyle.GilroyMedium16BlueA700,
                                  prefixWidget: Container(
                                      margin: getMargin(right: 8),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgGoogle)),
                                  onTap: () {
                                    onTapSigninwithgoogle();
                                  }),
                              CustomButton(
                                  height: getVerticalSize(50),
                                  text: "msg_sign_in_with_facebook".tr,
                                  margin: getMargin(left: 2, top: 16),
                                  variant: ButtonVariant.OutlineBlueA700,
                                  padding: ButtonPadding.PaddingT14,
                                  fontStyle:
                                      ButtonFontStyle.GilroyMedium16BlueA700,
                                  prefixWidget: Container(
                                      padding:
                                          getPadding(left: 9, top: 4, right: 3),
                                      margin: getMargin(right: 8),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.blue700,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(3))),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgFacebook)),
                                  onTap: () {
                                    onTapSigninwithfacebook();
                                  }),
                              CustomButton(
                                  height: getVerticalSize(50),
                                  text: "msg_sign_in_with_linkedin".tr,
                                  margin: getMargin(left: 2, top: 16),
                                  variant: ButtonVariant.OutlineBlueA700,
                                  padding: ButtonPadding.PaddingT14,
                                  fontStyle:
                                      ButtonFontStyle.GilroyMedium16BlueA700,
                                  prefixWidget: Container(
                                      margin: getMargin(right: 8),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgLinkedin11))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(top: 20, bottom: 5),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Don’t have an account? ".tr,
                                                style: TextStyle(
                                                    color: ColorConstant.fromHex(
                                                        "#ff12282a"),
                                                    fontSize: getFontSize(16),
                                                    fontFamily: 'Gilroy',
                                                    fontWeight: FontWeight.w400)),
                                            TextSpan(
                                                text: " ",
                                                style: TextStyle(
                                                    color: ColorConstant.fromHex(
                                                        "#ff12282a"),
                                                    fontSize: getFontSize(16),
                                                    fontFamily: 'Gilroy',
                                                    fontWeight: FontWeight.w700)),
                                            TextSpan(
                                              text: "Sign up.".tr,
                                              style: TextStyle(
                                                  color: ColorConstant.fromHex(
                                                      "#ff0061ff"),
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Gilroy',
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.toNamed(
                                                      AppRoutes.signUpScreen);
                                                },
                                            ),
                                          ]),
                                          textAlign: TextAlign.left)))
                            ]))),
              )),
        ));
  }

  onTapSigninwithgoogle() async {
    // await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
    //   if (googleUser != null) {
    //     //TODO Actions to be performed after signin
    //     // print("lkllkllklkl");
    //     Authorization authorization = Authorization();
    //     authorization.initializeAuthorization();
    //     return FutureBuilder(
    //         future: controller.future2(authorization.uid),
    //         builder: (BuildContext context, AsyncSnapshot snapshot) {
    //           if (snapshot.hasData) {
    //             if (snapshot.data == 1) {
    //               WidgetsBinding.instance.addPostFrameCallback((_) {
    //                 Get.toNamed(AppRoutes.contactListScreen);
    //               });
    //             }
    //             else{
    //               Get.toNamed(AppRoutes.signUpScreen);
    //             }
    //             return Container();
    //           } else if (snapshot.hasError) {
    //             WidgetsBinding.instance.addPostFrameCallback((_) {
    //               showDialog(
    //                 context: context,
    //                 builder: (BuildContext context) {
    //                   return AlertDialog(
    //                     title: Text('Error'),
    //                     content: Text('${snapshot.error}'),
    //                     actions: [
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pop();
    //                         },
    //                         child: Text('OK'),
    //                       ),
    //                     ],
    //                   );
    //                 },
    //               );
    //             });
    //             return Container();
    //           }
    //           return Center(child: CircularProgressIndicator());
    //         });
    //   } else {
    //     Get.snackbar('Error', 'msg_snack-bar_error_1'.tr);
    //   }
    // }).catchError((onError) {
    //   Get.snackbar('Error', onError.toString());
    // });
    showDialog(context: Get.context!,
        barrierColor: null,
        barrierDismissible: false,
        builder: (BuildContext context){
          return FutureBuilder(
              future: controller.future2(),
              builder:(BuildContext context, AsyncSnapshot snapshot) {
                isLoading=0;
                if (snapshot.hasData) {
                  // print("kjlkjlkjlkjlkjlkjlkjlkjlk");
                  Authorization authorization = Authorization();
                  authorization.initializeAuthorization();
                  if(snapshot.data!="") {
                    return FutureBuilder(
                        future: controller.future3(authorization.uid),
                        builder: (BuildContext context,
                            AsyncSnapshot snapshot) {
                          isLoading = 0;
                          if (snapshot.hasData) {
                            if (snapshot.data == 1) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Get.toNamed(AppRoutes.contactListScreen);
                              });
                            }
                            else {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Get.toNamed(AppRoutes.signupGoogle);
                              });
                            }
                            Get.back();
                            return Container();
                          } else if (snapshot.hasError) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('${snapshot.error}'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                            Get.back();
                            return Container();
                          }
                          isLoading = 1;
                          return Center(child: CircularProgressIndicator());
                          return Container();
                        });
                  }
                  else{
                    Get.back();
                    return Container();
                  }
                }
                else if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('${snapshot.error}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                  Get.back();
                  return Container();
                }
                isLoading=0;
                return Center(child: CircularProgressIndicator());
              }

              );

        }
        );


  }

  onTapSigninwithfacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapArrowleft11() {
    Get.back();
  }
}
