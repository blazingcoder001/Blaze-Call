import 'package:cloud_firestore/cloud_firestore.dart';


Future<int?> checkUserName(String username) async {
  print("CheckUserName.dart called");
  print("username"+username);
  int? result= await FirebaseFirestore.instance
      .collection('users')
      .doc(username)
      .get()
      .then((docSnapshot) async {
        if(!docSnapshot.exists){
          //doc does not exist
          return 1;
        }
        else{
          return 0;
        }

  }).catchError((onError){
    return 2;
  });
  return result;

}