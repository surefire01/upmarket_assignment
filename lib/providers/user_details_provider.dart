import 'package:flutter/cupertino.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsProvider with ChangeNotifier {
  Person person = Person();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void updatePersonList() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // update the database
    // implement the update task here
  }

  // upload image and get url
  Future<void> pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      final im = await file.readAsBytes();
    }

    //person.dpUrl = await storageService.uploadImage(im,userData.uid);
    notifyListeners();
  }
}
