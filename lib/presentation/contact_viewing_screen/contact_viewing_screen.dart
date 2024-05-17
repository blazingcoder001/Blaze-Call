import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
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
  int isLoading=0;
  @override
  Widget build(BuildContext context) {
    print("contact_viewing_screen.dart called");
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
                                  DisplayMessage displaymessage=DisplayMessage();
                                  showDialog(context: context,
                                      builder: (context){
                                    isLoading=0;
                                    String? username;
                                    return FutureBuilder(
                                        future: controller.future1(),
                                        builder: (BuildContext context, AsyncSnapshot snapshot){
                                          if(snapshot.hasData){
                                            if(snapshot.data!='0'){
                                              isLoading=0;
                                              username=snapshot.data;
                                              return FutureBuilder(
                                                  future: controller.future2(snapshot.data),
                                                  builder: (BuildContext context, AsyncSnapshot snapshot){
                                                    if(snapshot.hasData){
                                                      isLoading=0;
                                                      return FutureBuilder(
                                                          future: controller.future3(username!, args, snapshot.data),
                                                          builder: (BuildContext context, AsyncSnapshot snapshot){
                                                            isLoading=0;

                                                            if(snapshot.hasData){
                                                              if(snapshot.data==1){
                                                                ContactListItemModel x= ContactListItemModel();
                                                                x.userName=args.userName;
                                                                isLoading=0;
                                                               return FutureBuilder(
                                                                    future: controller.future4(args.userName!.value),
                                                                    builder: (BuildContext context, AsyncSnapshot snapshot){
                                                                      if(snapshot.hasData){
                                                                        List<dynamic>? list =snapshot.data;
                                                                        isLoading=0;
                                                                        return FutureBuilder(
                                                                              future: controller.future5(username!),
                                                                              builder: (BuildContext context, AsyncSnapshot snapshot){
                                                                                if(snapshot.hasData) {
                                                                                  return FutureBuilder(
                                                                                      future: controller
                                                                                          .future6(
                                                                                          args
                                                                                              .userName!
                                                                                              .value,
                                                                                          snapshot
                                                                                              .data,
                                                                                          list!),
                                                                                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                                                        if(snapshot.hasData){

                                                                                          if(snapshot.data==1){
                                                                                            displaymessage.display("msg_req_sent_successful".tr);
                                                                                          }
                                                                                          else if(snapshot.data==0){
                                                                                            displaymessage.display("msg_req_sent_error_saving_request".tr);
                                                                                          }

                                                                                          Get.back();
                                                                                          return Center(child: CircularProgressIndicator(),);
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
                                                                                          Get.back();
                                                                                          return Container();
                                                                                        }
                                                                                        isLoading=1;
                                                                                        return Center(child: CircularProgressIndicator());

                                                                                      });
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
                                                                                  Get.back();
                                                                                  return Container();
                                                                                }
                                                                                isLoading=1;
                                                                                return Center(child: CircularProgressIndicator());
                                                                              });


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
                                                                        Get.back();
                                                                        return Container();

                                                                      }

                                                                      isLoading=1;
                                                                      return Center(child:CircularProgressIndicator());


                                                                    });

                                                              }
                                                              else if(snapshot.data==0){
                                                                displaymessage.display("msg_req_sent_error_saving_request".tr);
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
                                                              Get.back();
                                                              return Container();
                                                            }
                                                            isLoading=1;
                                                            return Center(child: CircularProgressIndicator(),);

                                                          });


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
                                                      Get.back();
                                                      return Container();
                                                    }
                                                    isLoading=1;
                                                    return Center(child: CircularProgressIndicator(),);
                                                  });
                                            }
                                            else{
                                              displaymessage.display("msg_uid_does_not_exist".tr);
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
                                            Get.back();
                                            return Container();
                                          }
                                          isLoading=1;
                                          return Center(child: CircularProgressIndicator(),);

                                        });
                                  });
                              },



                            )

                          ])))),
        ));
  }

  onTapArrowleft7() {
    Get.back();
  }
}
