class Person {
  String name = "";
  String dpUrl =
      "https://firebasestorage.googleapis.com/v0/b/assignments-5a6a6.appspot.com/o/default%2Fuser.png?alt=media&token=22cfa301-270a-4592-8da4-252231f507ba";
  String? docId;

  Person();

  Person.formJson(Map map) {
    name = map['name'];
    dpUrl = map['dpUrl'];
    docId = map['docId'];
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "dpUrl": dpUrl, "docId": docId};
  }
}
