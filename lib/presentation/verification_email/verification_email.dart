import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/validation_functions.dart';
import 'package:blaze_call/core/utils/verification_email_backend.dart';
import 'package:blaze_call/presentation/displayMessagesSnackBar/displayMessage.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:blaze_call/widgets/custom_button.dart';
import 'package:blaze_call/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../core/utils/RemoveAccount.dart';
import '../../core/utils/SaveUserName.dart';
import '../../core/utils/emailSignup.dart';

// ignore_for_file: must_be_immutable
class VerificationEmail extends StatelessWidget {
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
          builder: (BuildContext context) {
            return FutureBuilder<int?>(future: verificationEmailBackend(),
                builder: (BuildContext context, AsyncSnapshot<int?> snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data==1){
                      return FutureBuilder<int?>(
                        future: emailSignup(
                            args[0], args[1], args[2], args[3]
                        ),
                        builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == 1) {
                              return FutureBuilder<
                                  int?>(
                                future: saveUserName(
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
                                          "Username saved successfully!");
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        Get.toNamed(AppRoutes.friendListScreen);
                                      });
                                      // return Text(
                                      //     "Username saved successfully");
                                      return Container(); //Empty container is returned that doesn't affect
                                      //the UI apart from a pale black color that goes when tapped once
                                      //on the screen.
                                    }
                                    else if (snapshot.data ==
                                        0) {
                                      displayMessage
                                          .display(
                                          "Some Error Occurred");
                                      removeAccount();
                                      // return Text(
                                      //     "Some Error Occurred");
                                      return Container();
                                    }
                                  } else if (snapshot
                                      .hasError) {
                                    return Text(
                                        '${snapshot
                                            .error}');
                                  }
                                  // return const CircularProgressIndicator();
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            }

                          }
                          else if (snapshot.hasError) {
                            return Text(
                                '${snapshot
                                    .error}');
                          }
                          // return const CircularProgressIndicator();
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    }
                  }
                  else if(snapshot.hasError){
                    return Text(
                        '${snapshot
                            .error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });

          }
      );
    });

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
                        ])))));
  }

  onTapArrowleft5() {
    Get.back();
  }
}
