class Person {
  String name = "";
  String dpUrl = "";
  String? _id;

  set setId(String id) {
    if (_id != null) {
      print("id can be set only once");
    }
    _id = _id ?? id;
  }

  Person();

  Person.formJson(Map map) {
    name = map['name'];
    dpUrl = map['dpUrl'];
    _id = map['id'];
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "dpUrl": dpUrl, "id": _id};
  }
}
