import 'package:get/get.dart';
import 'contactlist_item_model.dart';

class ContactListModel {
  Rx<List<ContactListItemModel>> contactListItemList =
      Rx(List.generate(10, (index) => ContactListItemModel()));
}

