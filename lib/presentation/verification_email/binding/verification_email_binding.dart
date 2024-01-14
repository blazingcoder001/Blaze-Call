import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/verification_email/controller/verification_email_controller.dart';

class VerificationEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationEmailController());
  }
}