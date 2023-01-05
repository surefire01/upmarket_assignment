import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:upmarket_assignment/services/storage_service.dart';

class ListUpdateService {
  // collection reference
  static final CollectionReference personCollection =
      FirebaseFirestore.instance.collection('persons');

  // to add person to firestore
  static Future createPerson(Person person, Uint8List? imageFile) async {
    final docUser = personCollection.doc();
    person.docId = docUser.id;
    if (imageFile != null) {
      person.dpUrl = await StorageService.uploadImage(imageFile, person.docId!);
    }

    return docUser.set(person.toJson());
  }

  // to delete person from firestore
  static Future deletePerson(Person person) async {
    final docUser = personCollection.doc(person.docId);
    await docUser.delete();
  }

  // to edit fields of person
  static Future editPerosn(Person person) async {
    final docUser = personCollection.doc(person.docId);
    docUser.update(person.toJson());
  }

  // person list
  static List<Person> _personListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var map = doc.data() as Map;

      return Person.formJson(map);
    }).toList();
  }

  // create a stream for the change in the database
  static Stream<List<Person>> get personList {
    return personCollection.snapshots().map(_personListFromSnapshot);
  }
}
