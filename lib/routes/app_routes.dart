import 'package:blaze_call/presentation/contact_us_screen/contact_us_screen.dart';
import 'package:blaze_call/presentation/contact_us_screen/binding/contact_us_binding.dart';
import 'package:blaze_call/presentation/friend_list_screen/contact_list_screen.dart';
import 'package:blaze_call/presentation/friend_list_screen/binding/contact_list_binding.dart';
import 'package:blaze_call/presentation/share_screen/share_screen.dart';
import 'package:blaze_call/presentation/share_screen/binding/share_binding.dart';
import 'package:blaze_call/presentation/image_management_screen/image_management_screen.dart';
import 'package:blaze_call/presentation/image_management_screen/binding/image_management_binding.dart';
import 'package:blaze_call/presentation/activity_feed_screen/activity_feed_screen.dart';
import 'package:blaze_call/presentation/activity_feed_screen/binding/activity_feed_binding.dart';
import 'package:blaze_call/presentation/add_friends_screen/add_friends_screen.dart';
import 'package:blaze_call/presentation/add_friends_screen/binding/add_friends_binding.dart';
import 'package:blaze_call/presentation/preview_video_screen/preview_video_screen.dart';
import 'package:blaze_call/presentation/preview_video_screen/binding/preview_video_binding.dart';
import 'package:blaze_call/presentation/verification_email/binding/verification_email_binding.dart';
import 'package:blaze_call/presentation/verification_email/verification_email.dart';
import 'package:blaze_call/presentation/video_call_screen/video_call_screen.dart';
import 'package:blaze_call/presentation/video_call_screen/binding/video_call_binding.dart';
import 'package:blaze_call/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:blaze_call/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:blaze_call/presentation/video_management_screen/video_management_screen.dart';
import 'package:blaze_call/presentation/video_management_screen/binding/video_management_binding.dart';
import 'package:blaze_call/presentation/contact_viewing_screen/contact_viewing_screen.dart';
import 'package:blaze_call/presentation/contact_viewing_screen/binding/contact_viewing_binding.dart';
import 'package:blaze_call/presentation/followers_screen/followers_screen.dart';
import 'package:blaze_call/presentation/followers_screen/binding/followers_binding.dart';
import 'package:blaze_call/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:blaze_call/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:blaze_call/presentation/user_account_screen/user_account_screen.dart';
import 'package:blaze_call/presentation/user_account_screen/binding/user_account_binding.dart';
import 'package:blaze_call/presentation/signup_login_module_screen/signup_login_module_screen.dart';
import 'package:blaze_call/presentation/signup_login_module_screen/binding/signup_login_module_binding.dart';
import 'package:blaze_call/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:blaze_call/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String contactUsScreen = '/contact_us_screen';

  static const String contactListScreen = '/contact_list_screen';

  static const String shareScreen = '/share_screen';

  static const String imageManagementScreen = '/image_management_screen';

  static const String activityFeedScreen = '/activity_feed_screen';

  static const String addFriendsScreen = '/add_friends_screen';

  static const String previewVideoScreen = '/preview_video_screen';

  static const String videoCallScreen = '/video_call_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String videoManagementScreen = '/video_management_screen';

  static const String contactViewingScreen = '/contact_sharing_screen';

  static const String followersScreen = '/followers_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String userAccountScreen = '/user_account_screen';

  static const String signupLoginModuleScreen = '/signup_login_module_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String emailVerification = '/emailVerification';


  static List<GetPage> pages = [
    GetPage(
      name: contactUsScreen,
      page: () => ContactUsScreen(),
      bindings: [
        ContactUsBinding(),
      ],
    ),
    GetPage(
      name: contactListScreen,
      page: () => FriendListScreen(),
      bindings: [
        FriendListBinding(),
      ],
    ),
    GetPage(
      name: shareScreen,
      page: () => ShareScreen(),
      bindings: [
        ShareBinding(),
      ],
    ),
    GetPage(
      name: imageManagementScreen,
      page: () => ImageManagementScreen(),
      bindings: [
        ImageManagementBinding(),
      ],
    ),
    GetPage(
      name: activityFeedScreen,
      page: () => ActivityFeedScreen(),
      bindings: [
        ActivityFeedBinding(),
      ],
    ),
    GetPage(
      name: addFriendsScreen,
      page: () => AddFriendsScreen(),
      bindings: [
        AddFriendsBinding(),
      ],
    ),
    GetPage(
      name: previewVideoScreen,
      page: () => PreviewVideoScreen(),
      bindings: [
        PreviewVideoBinding(),
      ],
    ),
    GetPage(
      name: videoCallScreen,
      page: () => VideoCallScreen(),
      bindings: [
        VideoCallBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: videoManagementScreen,
      page: () => VideoManagementScreen(),
      bindings: [
        VideoManagementBinding(),
      ],
    ),
    GetPage(
      name: contactViewingScreen,
      page: () => ContactViewingScreen(),
      bindings: [
        ContactViewingBinding(),
      ],
    ),
    GetPage(
      name: followersScreen,
      page: () => FollowersScreen(),
      bindings: [
        FollowersBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: userAccountScreen,
      page: () => UserAccountScreen(),
      bindings: [
        UserAccountBinding(),
      ],
    ),
    GetPage(
      name: signupLoginModuleScreen,
      page: () => SignupLoginModuleScreen(),
      bindings: [
        SignupLoginModuleBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SignupLoginModuleScreen(),
      bindings: [
        SignupLoginModuleBinding(),
      ],
    ),
    GetPage(
      name: emailVerification,
      page: () => VerificationEmail(),
      bindings: [
        VerificationEmailBinding(),
      ],
    ),
  ];
}
