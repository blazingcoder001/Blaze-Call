
import 'authorization.dart';

Future<int?> removeAccount() async {
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  int? result= await authorization.user?.delete().then((value){
    return 1;

  }).catchError((onError){
    return 0;
  });
  return result;
}