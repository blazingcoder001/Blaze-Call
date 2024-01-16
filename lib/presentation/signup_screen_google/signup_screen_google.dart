import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/validation_functions.dart';
import 'package:blaze_call/presentation/signup_screen_google/signup_screen_controller_google/signup_screen_controller_google.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_button.dart';
import 'package:blaze_call/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignUpScreenGoogle extends GetWidget<SignUpControllerGoogle> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int signUpResult;
  late int usernameCheck;
  late int createAccount;
  late int usernameSave;

  @override
  Widget build(BuildContext context) {
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
                                    check = 1;
                                    return "lbl_invalid_text".tr;
                                  } else if (value!.isEmpty) {
                                    check = 1;
                                    return "lbl_empty_field".tr;
                                  } else {
                                    check = 0;
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
                                    check = 1;
                                    return "lbl_invalid_text".tr;
                                  } else if (value!.isEmpty) {
                                    check = 1;
                                    return "lbl_empty_field".tr;
                                  } else {
                                    check = 0;
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
                                if (value!.isEmpty) {
                                  check = 1;
                                  return "lbl_empty_field".tr;
                                } else {
                                  check = 0;
                                }
                                return null;
                              },
                            ),

                            CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_create_account".tr,
                                margin: getMargin(top: 24, bottom: 5),
                                padding: ButtonPadding.PaddingAll14,
                                fontStyle: ButtonFontStyle.GilroyMedium16,
                                onTap: () async {
                                  _formKey.currentState!.validate();
                                  if (check == 0) {

                                    DisplayMessage displaymessage =
                                        DisplayMessage();

                                    showDialog(
                                        //used to call future inside onTap:() as future builder needs to be called
                                        // in the build context.
                                        context: Get.context!,
                                        barrierColor: null,
                                        builder: (BuildContext context) {
                                          return FutureBuilder<int?>(
                                            future: controller.future1(
                                                controller
                                                    .group10198ThreeController
                                                    .text),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<int?> snapshot) {
                                              if (snapshot.hasData) {
                                                // print("has");
                                                if (snapshot.data == 1) {
                                                  return FutureBuilder(
                                                      future: controller
                                                          .future2(controller
                                                              .group10198ThreeController
                                                              .text[0]
                                                              .toUpperCase()),
                                                      builder:
                                                          (BuildContext context,
                                                              AsyncSnapshot
                                                                  snapshot) {
                                                        if (snapshot.hasData) {
                                                          return FutureBuilder(
                                                              future: controller.future3(snapshot.data),
                                                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                                                if(snapshot.hasData){
                                                                  String url=snapshot.data;
                                                                  if(snapshot.data=="0"){
                                                                    displaymessage.display("lbl_prof_pic_upload_failed".tr);
                                                                  }
                                                                  else{
                                                                    return FutureBuilder(
                                                                        future: controller.future4(),
                                                                        builder: (BuildContext context,AsyncSnapshot snapshot){
                                                                          if(snapshot.hasData){
                                                                            return FutureBuilder(
                                                                                future: controller.future5(controller.group10198Controller.text[0].toUpperCase()+controller.group10198Controller.text.substring(1),
                                                                                    controller.group10198OneController.text[0].toUpperCase()+controller.group10198OneController.text.substring(1), snapshot.data, controller.group10198ThreeController.text, url, "google"),
                                                                                builder: (BuildContext context,AsyncSnapshot snapshot){
                                                                                  if(snapshot.hasData){
                                                                                    if(snapshot.data==1){
                                                                                      return FutureBuilder(
                                                                                          future: controller.future6(controller.group10198ThreeController.text, "google"),
                                                                                          builder: (BuildContext context, AsyncSnapshot snapshot){
                                                                                            if(snapshot.hasData){
                                                                                              if(snapshot.data==1){
                                                                                                    WidgetsBinding.instance
                                                                                                        .addPostFrameCallback((
                                                                                                    _) {
                                                                                                          Get.toNamed(AppRoutes.contactListScreen);
                                                                                                    });
                                                                                              }
                                                                                              else if(snapshot.data==0){
                                                                                                displaymessage.display("lbl_username_save_failed".tr);
                                                                                              }
                                                                                              return Container();
                                                                                            }
                                                                                            else if(snapshot.hasError){
                                                                                              WidgetsBinding
                                                                                                  .instance
                                                                                                  .addPostFrameCallback(
                                                                                                      (_) {
                                                                                                    showDialog(
                                                                                                      context: context,
                                                                                                      builder:
                                                                                                          (BuildContext
                                                                                                      context) {
                                                                                                        return AlertDialog(
                                                                                                          title: Text(
                                                                                                              'Error'),
                                                                                                          content: Text(
                                                                                                              '${snapshot.error}'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed:
                                                                                                                  () {
                                                                                                                Navigator.of(context)
                                                                                                                    .pop();
                                                                                                              },
                                                                                                              child: Text(
                                                                                                                  'OK'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  });
                                                                                              return Container();
                                                                                            }
                                                                                            return Center( child: CircularProgressIndicator());
                                                                                          });
                                                                                    }
                                                                                    else if(snapshot.data==0){
                                                                                      displaymessage.display("lbl_signup_failed".tr);
                                                                                    }
                                                                                    return Container();
                                                                                  }
                                                                                  else if (snapshot.hasError){
                                                                                    WidgetsBinding
                                                                                        .instance
                                                                                        .addPostFrameCallback(
                                                                                            (_) {
                                                                                          showDialog(
                                                                                            context: context,
                                                                                            builder:
                                                                                                (BuildContext
                                                                                            context) {
                                                                                              return AlertDialog(
                                                                                                title: Text(
                                                                                                    'Error'),
                                                                                                content: Text(
                                                                                                    '${snapshot.error}'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed:
                                                                                                        () {
                                                                                                      Navigator.of(context)
                                                                                                          .pop();
                                                                                                    },
                                                                                                    child: Text(
                                                                                                        'OK'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        });
                                                                                    return Container();
                                                                                  }
                                                                                  return Center(child: CircularProgressIndicator());
                                                                                });
                                                                          }
                                                                           else if(snapshot.hasError){
                                                                            WidgetsBinding
                                                                                .instance
                                                                                .addPostFrameCallback(
                                                                                    (_) {
                                                                                  showDialog(
                                                                                    context: context,
                                                                                    builder:
                                                                                        (BuildContext
                                                                                    context) {
                                                                                      return AlertDialog(
                                                                                        title: Text(
                                                                                            'Error'),
                                                                                        content: Text(
                                                                                            '${snapshot.error}'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed:
                                                                                                () {
                                                                                              Navigator.of(context)
                                                                                                  .pop();
                                                                                            },
                                                                                            child: Text(
                                                                                                'OK'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                });
                                                                            return Container();
                                                                          }
                                                                           return Center(child: CircularProgressIndicator());
                                                                        });

                                                                  }
                                                                  return Container();
                                                                }
                                                                else if(snapshot.hasError){
                                                                  WidgetsBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (_) {
                                                                        showDialog(
                                                                          context: context,
                                                                          builder:
                                                                              (BuildContext
                                                                          context) {
                                                                            return AlertDialog(
                                                                              title: Text(
                                                                                  'Error'),
                                                                              content: Text(
                                                                                  '${snapshot.error}'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed:
                                                                                      () {
                                                                                    Navigator.of(context)
                                                                                        .pop();
                                                                                  },
                                                                                  child: Text(
                                                                                      'OK'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      });
                                                                  return Container();
                                                                }
                                                                return Center(child: CircularProgressIndicator());
                                                              });
                                                        }
                                                        else if (snapshot
                                                            .hasError) {
                                                          WidgetsBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Error'),
                                                                  content: Text(
                                                                      '${snapshot.error}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                          'OK'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          });
                                                          return Container();
                                                        }
                                                        return Center(child: CircularProgressIndicator(),);
                                                      });

                                                } else if (snapshot.data == 0) {
                                                  displaymessage.display(
                                                      "msg_username_taken".tr);
                                                  // return Text(
                                                  //     "Username already taken! Please try another one.");
                                                  return Container();
                                                } else if (snapshot.data == 2) {
                                                  displaymessage.display(
                                                      "msg_some_error".tr);
                                                  // return Text(
                                                  //     "Some error occurred!");
                                                  return Container();
                                                }
                                                return Container();
                                              } else if (snapshot.hasError) {
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
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
                                                return Container();
                                              }
                                              // return const CircularProgressIndicator();
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                          );
                                        });
                                  }
                                  // check=0;
                                })
                          ]))),
            )));
  }

  onTapArrowleft9() {
    Get.back();
  }
}
