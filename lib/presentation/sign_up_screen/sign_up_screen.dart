import 'package:blaze_call/core/utils/CreateAccountEmail.dart';
import 'package:blaze_call/core/utils/CheckUserName.dart';
import 'package:blaze_call/core/utils/RemoveAccount.dart';
import 'package:blaze_call/core/utils/SaveUserName.dart';
import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/core/utils/deleteUser.dart';
import 'package:blaze_call/core/utils/emailSignup.dart';
import 'package:blaze_call/core/utils/verification_email_backend.dart';

import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';

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
  int  isLoading=0;


  @override
  Widget build(BuildContext context) {
    print("sign_up_screen.dart called");
    int check = 0;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
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
            body: SingleChildScrollView(
              child: Form(
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
                                    check=1;
                                    return "lbl_invalid_text".tr;
                                  }
                                  else if(value!.isEmpty){
                                    check=1;
                                    return "lbl_empty_field".tr;
                                  }
                                  else{
                                    check=0;
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
                                    check=1;
                                    return "lbl_invalid_text".tr;
                                  }
                                  else if(value!.isEmpty){
                                    check=1;
                                    return "lbl_empty_field".tr;
                                  }
                                  else{
                                    check=0;
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
                                    check=1;
                                    return "lbl_invalid_email".tr;
                                  }
                                  else{
                                    check=0;
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
                                // validator: (value) {
                                //   if (!isValidPhone(value)) {
                                //     return "Please enter valid phone number";
                                //   }
                                //   check=1;
                                //   return null;
                                // }
                              validator: (value){
                                if(value!.isEmpty){
                                check=1;
                                return "lbl_empty_field".tr;
                                }
                                else{
                                  check=0;
                                }
                                return null;
                              },
                                ),
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
                                // padding: TextFormFieldPadding.PaddingT12,
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
                                    check=1;
                                    return "lbl_invalid_password".tr;
                                  }
                                  else{
                                    check=0;
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
                              _formKey.currentState!.validate();
                              if (check==0) {
                                // print("controller3 value:" + controller
                                //     .group10198ThreeController.text);
                                DisplayMessage displaymessage = DisplayMessage();

                                showDialog( //used to call future inside onTap:() as future builder needs to be called
                                  // in the build context.
                                    context: Get.context!,
                                    barrierColor: null,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return FutureBuilder<int?>(
                                        future: controller.future1(
                                            controller.group10198ThreeController
                                                .text),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int?> snapshot) {
                                          isLoading=0;
                                          if (snapshot.hasData) {
                                            // print("has");
                                            if (snapshot.data == 1) {
                                              return FutureBuilder<int?>(
                                                future: controller.future2(
                                                    controller
                                                        .group10198TwoController
                                                        .text, controller
                                                    .group10198FourController
                                                    .text),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                        int?> snapshot) {
                                                  isLoading=0;
                                                  if (snapshot.hasData) {
                                                    if (snapshot.data == 1) {
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback((
                                                          _) {
                                                        // Do something after the build phase is complete
                                                        // For example, call setState()
                                                        Get.toNamed(AppRoutes
                                                            .emailVerification,
                                                          arguments: [
                                                            controller
                                                                .group10198Controller
                                                                .text,
                                                            controller
                                                                .group10198OneController
                                                                .text,
                                                            controller
                                                                .group10198TwoController
                                                                .text,
                                                            controller
                                                                .group10198ThreeController
                                                                .text,
                                                          ],
                                                        );

                                                      });
                                                    }
                                                    else if (snapshot.data == 0) {
                                                      displaymessage.display(
                                                          "msg_acc_exists_email".tr);

                                                      return Container();
                                                      // Authorization authorization=Authorization();
                                                      // authorization.initializeAuthorization();
                                                      // return FutureBuilder(
                                                      //     future: controller.future3(controller
                                                      //         .group10198TwoController
                                                      //         .text, controller
                                                      //         .group10198FourController
                                                      //         .text ),
                                                      //     builder:(BuildContext context, AsyncSnapshot snapshot)  {
                                                      //       if(snapshot.hasData){
                                                      //         if(snapshot.data==1){
                                                      //           authorization.initializeAuthorization();
                                                      //           return FutureBuilder(
                                                      //               future:controller.future4(authorization.uid) ,
                                                      //               builder: (BuildContext context, AsyncSnapshot snapshot){
                                                      //                 if(snapshot.hasData){
                                                      //                   if(snapshot.data==0){
                                                      //                     return FutureBuilder(
                                                      //                         future: controller.future5(),
                                                      //                         builder: (BuildContext context,AsyncSnapshot snapshot){
                                                      //                           if(snapshot.hasData) {
                                                      //                             if(snapshot.data==1) {
                                                      //                               return FutureBuilder(
                                                      //                                   future: controller
                                                      //                                       .future2(
                                                      //                                       controller
                                                      //                                           .group10198TwoController
                                                      //                                           .text,
                                                      //                                       controller
                                                      //                                           .group10198FourController
                                                      //                                           .text),
                                                      //                                   builder: (
                                                      //                                       BuildContext context,
                                                      //                                       AsyncSnapshot snapshot) {
                                                      //                                     if (snapshot
                                                      //                                         .hasData) {
                                                      //                                       if (snapshot
                                                      //                                           .data ==
                                                      //                                           1) {
                                                      //                                         WidgetsBinding
                                                      //                                             .instance
                                                      //                                             .addPostFrameCallback((
                                                      //                                             _) {
                                                      //                                           // Do something after the build phase is complete
                                                      //                                           // For example, call setState()
                                                      //                                           Get
                                                      //                                               .toNamed(
                                                      //                                             AppRoutes
                                                      //                                                 .emailVerification,
                                                      //                                             arguments: [
                                                      //                                               controller
                                                      //                                                   .group10198Controller
                                                      //                                                   .text,
                                                      //                                               controller
                                                      //                                                   .group10198OneController
                                                      //                                                   .text,
                                                      //                                               controller
                                                      //                                                   .group10198TwoController
                                                      //                                                   .text,
                                                      //                                               controller
                                                      //                                                   .group10198ThreeController
                                                      //                                                   .text,
                                                      //                                             ],
                                                      //                                           );
                                                      //                                         });
                                                      //                                       }
                                                      //                                       else
                                                      //                                       if (snapshot
                                                      //                                           .data ==
                                                      //                                           0) {
                                                      //                                         displaymessage
                                                      //                                             .display(
                                                      //                                             "lbl_error_create_account"
                                                      //                                                 .tr);
                                                      //                                       }
                                                      //                                       return Container();
                                                      //                                     }
                                                      //                                     else
                                                      //                                     if (snapshot
                                                      //                                         .hasError) {
                                                      //                                       WidgetsBinding
                                                      //                                           .instance
                                                      //                                           .addPostFrameCallback((
                                                      //                                           _) {
                                                      //                                         showDialog(
                                                      //                                           context: context,
                                                      //                                           builder: (
                                                      //                                               BuildContext context) {
                                                      //                                             return AlertDialog(
                                                      //                                               title: Text(
                                                      //                                                   'Error'),
                                                      //                                               content: Text(
                                                      //                                                   '${snapshot
                                                      //                                                       .error}'),
                                                      //                                               actions: [
                                                      //                                                 TextButton(
                                                      //                                                   onPressed: () {
                                                      //                                                     Navigator
                                                      //                                                         .of(
                                                      //                                                         context)
                                                      //                                                         .pop();
                                                      //                                                   },
                                                      //                                                   child: Text(
                                                      //                                                       'OK'),
                                                      //                                                 ),
                                                      //                                               ],
                                                      //                                             );
                                                      //                                           },
                                                      //                                         );
                                                      //                                       });
                                                      //                                       return Container();
                                                      //                                     }
                                                      //                                     return Center(
                                                      //                                         child: CircularProgressIndicator());
                                                      //                                   });
                                                      //                             }
                                                      //                             else if(snapshot.data==0){
                                                      //                               displaymessage.display("lbl_error_create_account".tr);
                                                      //                             }
                                                      //                             return Container();
                                                      //
                                                      //                           }
                                                      //                           else if(snapshot.hasError){
                                                      //                             WidgetsBinding
                                                      //                                 .instance
                                                      //                                 .addPostFrameCallback((
                                                      //                                 _) {
                                                      //                               showDialog(
                                                      //                                 context: context,
                                                      //                                 builder: (
                                                      //                                     BuildContext context) {
                                                      //                                   return AlertDialog(
                                                      //                                     title: Text(
                                                      //                                         'Error'),
                                                      //                                     content: Text(
                                                      //                                         '${snapshot
                                                      //                                             .error}'),
                                                      //                                     actions: [
                                                      //                                       TextButton(
                                                      //                                         onPressed: () {
                                                      //                                           Navigator
                                                      //                                               .of(
                                                      //                                               context)
                                                      //                                               .pop();
                                                      //                                         },
                                                      //                                         child: Text(
                                                      //                                             'OK'),
                                                      //                                       ),
                                                      //                                     ],
                                                      //                                   );
                                                      //                                 },
                                                      //                               );
                                                      //                             });
                                                      //                             return Container();
                                                      //                           }
                                                      //                           return Center(child: CircularProgressIndicator());
                                                      //
                                                      //
                                                      //                         });
                                                      //                   }
                                                      //                   else if(snapshot.data==1){
                                                      //
                                                      //                     displaymessage.display(
                                                      //                         "msg_acc_exists_email".tr);
                                                      //
                                                      //                     return Container();
                                                      //                   }
                                                      //                 }
                                                      //                 else if(snapshot.hasError){
                                                      //                   WidgetsBinding.instance
                                                      //                       .addPostFrameCallback((
                                                      //                       _) {
                                                      //                     showDialog(
                                                      //                       context: context,
                                                      //                       builder: (BuildContext context) {
                                                      //                         return AlertDialog(
                                                      //                           title: Text('Error'),
                                                      //                           content: Text('${snapshot
                                                      //                               .error}'),
                                                      //                           actions: [
                                                      //                             TextButton(
                                                      //                               onPressed: () {
                                                      //                                 Navigator.of(context).pop();
                                                      //                               },
                                                      //                               child: Text('OK'),
                                                      //                             ),
                                                      //                           ],
                                                      //                         );
                                                      //                       },
                                                      //                     );
                                                      //                   });
                                                      //                   return Container();
                                                      //                 }
                                                      //                 return Center(child: CircularProgressIndicator());
                                                      //               });
                                                      //           // return FutureBuilder(
                                                      //           //     future: controller.future4(),
                                                      //           //     builder: (BuildContext context,AsyncSnapshot snapshot){
                                                      //           //       return Container();
                                                      //           //     });
                                                      //         }
                                                      //
                                                      //       }
                                                      //       else if(snapshot.hasError){
                                                      //         WidgetsBinding.instance
                                                      //             .addPostFrameCallback((
                                                      //             _) {
                                                      //           showDialog(
                                                      //             context: context,
                                                      //             builder: (BuildContext context) {
                                                      //               return AlertDialog(
                                                      //                 title: Text('Error'),
                                                      //                 content: Text('${snapshot
                                                      //                     .error}'),
                                                      //                 actions: [
                                                      //                   TextButton(
                                                      //                     onPressed: () {
                                                      //                       Navigator.of(context).pop();
                                                      //                     },
                                                      //                     child: Text('OK'),
                                                      //                   ),
                                                      //                 ],
                                                      //               );
                                                      //             },
                                                      //           );
                                                      //         });
                                                      //         return Container();
                                                      //       }
                                                      //       return Center(
                                                      //           child: CircularProgressIndicator());
                                                      //     });
                                                    }
                                                    Get.back();
                                                    return Container();
                                                  } else
                                                  if (snapshot.hasError) {
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback((
                                                        _) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title: Text('Error'),
                                                            content: Text('${snapshot
                                                                .error}'),
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
                                                  isLoading=1;

                                                  // return const CircularProgressIndicator();
                                                  return Center(
                                                    child: CircularProgressIndicator(),
                                                  );
                                                },
                                              );
                                            }
                                            else if (snapshot.data == 0) {
                                              displaymessage.display(
                                                  "msg_username_taken".tr);
                                              // return Text(
                                              //     "Username already taken! Please try another one.");
                                              return Container();
                                            }
                                            else if (snapshot.data == 2) {
                                              displaymessage.display(
                                                  "msg_some_error".tr);
                                              // return Text(
                                              //     "Some error occurred!");
                                              return Container();
                                            }
                                          } else if (snapshot.hasError) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((
                                                _) {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  isLoading=1;
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text('${snapshot
                                                        .error}'),
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
                                          // return const CircularProgressIndicator();
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }
                                );
                              }
                              // check=0;

                            }
                                )
                          ]
                      )
                  )
              ),
            )
        )
    );
  }

  onTapArrowleft9() {
    Get.back();
  }
}
