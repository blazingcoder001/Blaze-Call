import '../friend_list_screen/widgets/friendlist_item_widget.dart';
import 'controller/friend_list_controller.dart';
import 'models/friendlist_item_model.dart';
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
                // actions: [
                //   AppbarImage(
                //       height: getSize(24),
                //       width: getSize(24),
                //       svgPath: ImageConstant.imgSearch,
                //       margin:
                //           getMargin(left: 16, top: 13, right: 16, bottom: 12))
                // ]
            ),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(
                              left: 42, top: 12, right: 42, bottom: 12),
                          decoration: AppDecoration.outlineBluegray100,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(left: 12, bottom: 5),
                                    child: Text("lbl_all_friends".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroyMedium16BlueA700)),
                                Padding(
                                    padding: getPadding(top: 1, bottom: 3),
                                    child: Text("lbl_requests_pending".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtGilroyMedium16Bluegray400))
                              ])),
                      SizedBox(
                          width: getHorizontalSize(139),
                          child: Divider(
                              height: getVerticalSize(2),
                              thickness: getVerticalSize(2),
                              color: ColorConstant.blueA700,
                              indent: getHorizontalSize(44))),
                      Padding(
                          padding: getPadding(top: 22),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(17));
                              },
                              itemCount: controller.friendListModelObj.value
                                  .friendlistItemList.value.length,
                              itemBuilder: (context, index) {
                                FriendlistItemModel model = controller
                                    .friendListModelObj
                                    .value
                                    .friendlistItemList
                                    .value[index];
                                return FriendlistItemWidget(model);
                              })))
                    ]))));
  }

  onTapArrowleft1() {
    Get.back();
  }
}

class SearchBar extends SearchDelegate<String> {
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
    // Implement your suggestion logic here.
    return const Center(
      child: Text('Search Suggestions'),
    );
  }
}
