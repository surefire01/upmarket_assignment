import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upmarket_assignment/services/list_update_service.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';

class UserDetailsProvider with ChangeNotifier {
  Person person = Person();

  bool isLoading = false;

  // we get this by selecting image from the device
  Uint8List? image;

  Future<void> updatePersonList(bool isNew) async {
    isLoading = true;
    notifyListeners();
    if (isNew) {
      await ListUpdateService.createPerson(person, image);
      showToastMsg("user added");
      isLoading = false;
      notifyListeners();
      return;
    }
    await ListUpdateService.editPerosn(person);
    showToastMsg("edit successful");
    isLoading = false;
    notifyListeners();
  }

  // upload image and get url
  Future<void> pickImage({String docId = ""}) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = await file.readAsBytes();
      notifyListeners();
    }
  }

  // to clear the last edit
  void clear() {
    person = Person();
    isLoading = false;
    image = null;
  }
}
