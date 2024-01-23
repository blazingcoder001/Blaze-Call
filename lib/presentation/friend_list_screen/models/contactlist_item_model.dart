import 'package:get/get.dart';

class ContactListItemModel {
  Rx<String>? userName=Rx("blah");

  Rx<String>? firstName=Rx("blaaah");

  Rx<String>? lastName=Rx("bllaaaaaah");

  Rx<String>? profilePicUrl=Rx("lklklklkl");

   Map<String,String> toMap(){
    Map<String,String> result= new Map();
    result['userName']=userName!.value;
    result['firstName']=firstName!.value;
    result['lastName']=lastName!.value;
    result['profilePicUrl']=profilePicUrl!.value;
    return result;
  }
}
