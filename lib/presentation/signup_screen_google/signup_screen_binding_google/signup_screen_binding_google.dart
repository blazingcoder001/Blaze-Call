import 'package:blaze_call/presentation/signup_screen_google/signup_screen_controller_google/signup_screen_controller_google.dart';
import 'package:get/get.dart';

class SignupScreenBindingGoogle extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerGoogle());
  }
}
