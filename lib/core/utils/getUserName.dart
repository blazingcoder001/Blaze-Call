import 'package:blaze_call/core/utils/authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<String?> getUserName() async {
  print("getUserName.dart called");
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  String? result= await FirebaseFirestore.instance
      .collection('UID')
      .doc(authorization.uid)
      .get()
      .then((docSnapshot) async {
    if(!docSnapshot.exists){
      //doc does not exist
      return '0';
    }
    else{
      return docSnapshot.data()?['Username'];
    }

  }).catchError((onError){
    return 2;
  });
  return result;

}