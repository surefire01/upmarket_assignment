import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upmarket_assignment/providers/user_details_provider.dart';

import '../model/person_model.dart';

class AddPersonView extends StatelessWidget {
  const AddPersonView({
    super.key,
    required this.screenTitle,
    this.person,
  });

  final String screenTitle;
  final Person? person;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserDetailsProvider>(context);
    if (person != null) {
      provider.person = Person.formJson(person!.toJson());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  //backgroundImage: NetworkImage(provider.person.dpUrl),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_enhance,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: provider.person.name,
                  validator: (value) {
                    if (value != null) {
                      provider.person.name = value;
                    } else {
                      return "Enter Valid name";
                    }
                  },
                  decoration: const InputDecoration(label: Text("name")),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  width: double.infinity,
                  color: Colors.orange,
                  child: TextButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
