import 'package:flutter/material.dart';
import 'package:upmarket_assignment/model/person_model.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      elevation: 1.5,
      shadowColor: Colors.grey[200],
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        horizontalTitleGap: 30,
        title: Text(
          person.name,
          style: TextStyle(
              wordSpacing: 6,
              color: Colors.grey[600],
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
        leading: CircleAvatar(backgroundImage: NetworkImage(person.dpUrl)),
      ),
    );
  }
}
