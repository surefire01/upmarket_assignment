import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upmarket_assignment/services/list_update_service.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';

class UserDetailsProvider with ChangeNotifier {
  Person person = Person();

  bool isLoading = false;
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
  // temp varible is used to temp store the image when user confirm this then the image is uploaded in a folder with specific docId
  Future<void> pickImage({bool isTemp = true, String docId = ""}) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = await file.readAsBytes();
      notifyListeners();
    }
  }

  void clear() {
    person = Person();
    isLoading = false;
    image = null;
  }
}
