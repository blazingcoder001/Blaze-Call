import '../controller/contact_list_controller.dart';
import '../models/contactlist_item_model.dart';
import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FriendlistItemWidget extends StatelessWidget {
  FriendlistItemWidget(this.friendlistItemModelObj);

  ContactListItemModel friendlistItemModelObj;

  var controller = Get.find<FriendListController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CustomImageView(
        //   imagePath: friendlistItemModelObj.profilePicUrl!.value,
        //   height: getSize(
        //     50,
        //   ),
        //   width: getSize(
        //     50,
        //   ),
        //   radius: BorderRadius.circular(
        //     getHorizontalSize(
        //       25,
        //     ),
        //   ),
        // ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Row(
              children:[ Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    friendlistItemModelObj.profilePicUrl!.value,
                    height: getSize(50),
                    width: getSize(50),
                    fit: BoxFit.cover,
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

            Container(
              width: getHorizontalSize(
                112,
              ),
              margin: getMargin(
                left: 16,
                top: 5,
                bottom: 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      friendlistItemModelObj.userName!.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroySemiBold18,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 3,
                    ),
                    child: Obx(
                      () => Text(
                        friendlistItemModelObj.firstName!.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroyRegular14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ]),
            onTap: (){
    Get.toNamed(AppRoutes.contactViewingScreen, arguments: friendlistItemModelObj);
    },
          ),
        ),
        GestureDetector(
          child: CustomImageView(
            svgPath: ImageConstant.imgUser,
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            margin: getMargin(
              top: 13,
              bottom: 13,
            ),
          ),
        ),
      ],
    );
  }
}
