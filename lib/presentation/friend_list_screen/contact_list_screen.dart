import 'package:blaze_call/presentation/friend_list_screen/models/contact_list_model.dart';

import '../friend_list_screen/widgets/contact_item_widget.dart';
import 'controller/contact_list_controller.dart';
import 'models/contactlist_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FriendListScreen extends GetWidget<FriendListController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Get.toNamed(AppRoutes.addFriendsScreen);
                showSearch(context: context, delegate: SearchBar());
                // Add your onPressed code here!
              },
              child: Icon(Icons.add),
              backgroundColor: ColorConstant.blueA700,
            ),
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(49),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 13, bottom: 12),
                    onTap: () {
                      onTapArrowleft1();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_contact_list".tr),

            ),
            body:
            Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(
                              left: 0, top: 12, right: 6, bottom: 12),
                          decoration: AppDecoration.outlineBluegray100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                GestureDetector(
                                  onTap: (){
                                    controller.selectedIndex.value=0;
                                  },
                                    child:Obx(() => Padding(
                                        padding: getPadding(left: 12, bottom: 5),
                                        child: Text("lbl_all_friends".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            // style: AppStyle
                                            //     .txtGilroyMedium16BlueA700
                                          style: controller.selectedIndex.value == 0
                                              ? AppStyle.txtGilroyMedium16BlueA700
                                              : AppStyle.txtGilroyMedium16Bluegray400,
                                        )
                                    )),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    controller.selectedIndex.value=1;
                                  },
                                  child: Obx(() => Padding(
                                      padding: getPadding(top: 1, bottom: 3),
                                      child: Text("lbl_requests_pending".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                        style: controller.selectedIndex.value == 1
                                            ? AppStyle.txtGilroyMedium16BlueA700
                                            : AppStyle.txtGilroyMedium16Bluegray400,))),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    controller.selectedIndex.value=2;
                                  },
                                  child: Obx(() => Padding(
                                      padding: getPadding(top: 1, bottom: 3),
                                      child: Text("lbl_requests_sent".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                        style: controller.selectedIndex.value == 2
                                            ? AppStyle.txtGilroyMedium16BlueA700
                                            : AppStyle.txtGilroyMedium16Bluegray400,))),
                                )
                              ])),
                      Obx(() =>
                      controller.selectedIndex.value==0?SizedBox(
                          width: getHorizontalSize(105),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.blueA700,
                              indent: getHorizontalSize(3))):SizedBox()),
                      Obx(() =>
                      controller.selectedIndex.value==1?SizedBox(
                          width: getHorizontalSize(260),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.blueA700,
                              indent: getHorizontalSize(130))):SizedBox()),
                      Obx(() =>
                      controller.selectedIndex.value==2?SizedBox(
                          width: getHorizontalSize(400),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.blueA700,
                              indent: getHorizontalSize(300))):SizedBox()),

                      Obx(() => Expanded(child: Stack(
                        children: [
                          Visibility(
                            visible: controller.selectedIndex.value == 0,
                            child:
                            Padding(
                                padding: getPadding(top: 22),
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: getVerticalSize(17));
                                    },
                                    itemCount: controller.contactListModelObj.value
                                        .contactListItemList.value.length,
                                    itemBuilder: (context, index) {
                                      ContactListItemModel model = controller
                                          .contactListModelObj
                                          .value
                                          .contactListItemList
                                          .value[index];
                                      return FriendlistItemWidget(model);
                                    })

                            ),
                          ),
                          Visibility(
                            visible: controller.selectedIndex.value == 1,
                            child: Padding(
                              padding: getPadding(top: 21),

                              child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: getVerticalSize(17));
                                  },
                                  itemCount: controller.contactListModelObj.value
                                      .contactListItemList.value.length,
                                  itemBuilder: (context, index) {
                                    ContactListItemModel model = controller
                                        .contactListModelObj
                                        .value
                                        .contactListItemList
                                        .value[index];
                                    return FriendlistItemWidget(model);
                                  }),
                            ),
                          ),
                          Visibility(
                            visible: controller.selectedIndex.value == 2,
                            child: ListView(
                              // Your third content here.
                            ),
                          ),
                        ],
                      )))
                    ]))));
  }

  onTapArrowleft1() {
    Get.back();
  }
}

class SearchBar extends SearchDelegate<String> {
  final FriendListController controller = Get.put(FriendListController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        await Future.delayed(Duration(milliseconds: 500 ));
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search logic here.

    return const Center(
      child: Text('Search Results'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {


         return StreamBuilder<Rx<List<ContactListItemModel>>?>(
          stream: controller.getContacts(query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.value[index].userName!.value),
                  );
                },
              );
            }
          },
        );
  }
}
