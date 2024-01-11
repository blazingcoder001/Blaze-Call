import '../add_friends_screen/widgets/addfriends_item_widget.dart';
import 'controller/add_friends_controller.dart';
import 'models/addfriends_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/widgets/app_bar/appbar_image.dart';
import 'package:blaze_call/widgets/app_bar/appbar_title.dart';
import 'package:blaze_call/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddFriendsScreen extends GetWidget<AddFriendsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      onTapArrowleft3();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_friends".tr),
                // actions: [
                //   AppbarImage(
                //       height: getSize(24),
                //       width: getSize(24),
                //       svgPath: ImageConstant.imgSearch,
                //       margin:
                //           getMargin(left: 16, top: 13, right: 16, bottom: 12))
                // ]
              actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSearch,
                      margin:
                      getMargin(left: 16, top: 13, right: 16, bottom: 12),
                    onTap: (){
                      showSearch(context: context, delegate: SearchBar());
                    },
                  )
              ],
            ),
            body: Padding(
                padding: getPadding(left: 16, top: 19, right: 16),
                child: Obx(() => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(26));
                    },
                    itemCount: controller.addFriendsModelObj.value
                        .addfriendsItemList.value.length,
                    itemBuilder: (context, index) {
                      AddfriendsItemModel model = controller.addFriendsModelObj
                          .value.addfriendsItemList.value[index];
                      return AddfriendsItemWidget(model);
                    })))));
  }


  onTapArrowleft3() {
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
      onPressed: () {
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
