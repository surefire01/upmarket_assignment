import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final firebaseStorage = FirebaseStorage.instance;

  // function to add image to storage
  static Future<String> uploadImage(Uint8List file, String docId) async {
    Reference ref = firebaseStorage.ref().child("ProfilePics").child(docId);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
