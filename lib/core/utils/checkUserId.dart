import 'package:cloud_firestore/cloud_firestore.dart';

Future<int?> checkUID(String? uid) async {
  print("checkUserId.dart called");
  int? result= await FirebaseFirestore.instance
      .collection('UID')
      .doc(uid)
      .get()
      .then((docSnapshot) async {
    if(!docSnapshot.exists){
      //doc does not exist
      return 0;
    }
    else{
      return 1;
    }

  }).catchError((onError){
    return 2;
  });
  return result;

}