import 'dart:typed_data';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/displayMessagesSnackBar/displayMessage.dart';
import 'package:blaze_call/presentation/verification_email/controller/verification_email_controller.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';

import 'package:flutter/material.dart';

import '../../core/utils/RemoveAccount.dart';


// ignore_for_file: must_be_immutable
class VerificationEmail extends GetWidget<VerificationEmailController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? result;
  List<String> args= Get.arguments;
  @override
  Widget build(BuildContext context) {
    DisplayMessage displayMessage=DisplayMessage();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          barrierColor: null,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return FutureBuilder<int?>(
                future: controller.future1(),
                builder: (BuildContext context, AsyncSnapshot<int?> snapshot){
                  if(snapshot.hasData){
                    print("data: "+snapshot.data.toString());
                    if(snapshot.data==1){
                      return FutureBuilder
                        (
                          future: controller.future2(args[0][0].toUpperCase()),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if (snapshot.hasData){
                              ByteData pic=snapshot.data;

                              return FutureBuilder
                                (future: controller.future3(pic),
                                  builder:  (BuildContext context, AsyncSnapshot snapshot){

                                  if( snapshot.hasData){
                                    if(snapshot.data!='0') {
                                      return FutureBuilder<int?>(
                                        future: controller.future4(
                                            args[0][0].toUpperCase()+args[0].substring(1), args[1][0].toUpperCase()+args[1].substring(1), args[2], args[3],snapshot.data,
                                          "email"
                                        ),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int?> snapshot) {
                                          if (snapshot.hasData) {
                                            if (snapshot.data == 1) {
                                              return FutureBuilder<
                                                  int?>(
                                                future: controller.future5(
                                                    args[3], "email"),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                        int?> snapshot) {
                                                  if (snapshot
                                                      .hasData) {
                                                    if (snapshot.data ==
                                                        1) {
                                                      displayMessage
                                                          .display(
                                                          "lbl_username_saved".tr);
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback((
                                                          _) {
                                                        Get.toNamed(AppRoutes
                                                            .contactListScreen);
                                                      });
                                                      // return Text(
                                                      //     "Username saved successfully");
                                                      return Container(); //Empty container is returned that doesn't affect
                                                      //the UI
                                                    }
                                                    else if (snapshot.data ==
                                                        0) {
                                                      displayMessage
                                                          .display(
                                                          "lbl_some_error".tr);
                                                      removeAccount();
                                                      // return Text(
                                                      //     "Some Error Occurred");
                                                      return Container();
                                                    }
                                                    Get.back();

                                                  } else if (snapshot
                                                      .hasError) {
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
                                                    return Container();
                                                  }
                                                  // return const CircularProgressIndicator();
                                                  return Center(
                                                    child: CircularProgressIndicator(),
                                                  );
                                                },
                                              );
                                            }
                                            Get.back();
                                            return Container();
                                          }
                                          else if (snapshot.hasError) {

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
                                            return Container();

                                          }
                                          // return const CircularProgressIndicator();
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }
                                    else{


                                      WidgetsBinding.instance
                                          .addPostFrameCallback((
                                          _) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Error'),
                                              content: Text('lbl_prof_pic_upload_failed'.tr),
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
                                      return Container();

                                    }

                                    }
                                  else if(snapshot.hasError){
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
                                    return Container();

                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );

                                  });

                            }
                            else if (snapshot.hasError) {
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
                              return Container();

                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                      );
                    }
                    else if(snapshot.data==-1){
                      displayMessage.display("lbl_verification_timeout".tr);
                    }
                    Get.back();
                    return Container();
                  }
                  else if(snapshot.hasError){
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
                    return Container();

                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });

          }
      );
    });

    return SafeArea(
        child: WillPopScope(
          onWillPop: () async{
            controller.onClose();
            return true;
          },
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
                        onTapArrowleft5();
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "lbl_verification_email".tr)),
              body: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: getPadding(left: 16, top: 119, right: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgLock,
                                height: getVerticalSize(100),
                                width: getHorizontalSize(93),
                                alignment: Alignment.center),
                            Container(
                                width: getHorizontalSize(378),
                                margin: getMargin(left: 8, top: 36, right: 8),
                                child: Text("msg_verification_email".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style:
                                    AppStyle.txtGilroyMedium16Bluegray400)),
                          ])))),
        ));
  }

  onTapArrowleft5() {
    Get.back();
  }
}
