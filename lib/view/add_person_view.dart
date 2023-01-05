import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upmarket_assignment/providers/user_details_provider.dart';
import 'package:upmarket_assignment/utils/loading_widget.dart';

import '../model/person_model.dart';

// to add/edit person
class AddPersonView extends StatelessWidget {
  AddPersonView({
    super.key,
    required this.screenTitle,
    this.person,
    this.isNew = true,
  });

  final _formKey = GlobalKey<FormState>();
  final bool isNew;
  final String screenTitle;
  final Person? person;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserDetailsProvider>(context, listen: false);
    if (person != null) {
      provider.person = Person.formJson(person!.toJson());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        leading: BackButton(
          color: Colors.white,
          onPressed: (() {
            Navigator.pop(context);
            provider.clear();
          }),
        ),
      ),
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),
                  Consumer<UserDetailsProvider>(
                      builder: ((context, value, child) {
                    ImageProvider imageProvider;

                    if (value.image == null) {
                      imageProvider = NetworkImage(value.person.dpUrl);
                    } else {
                      imageProvider = MemoryImage(value.image!);
                    }

                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: imageProvider,
                      child: IconButton(
                        onPressed: () async {
                          await provider.pickImage();
                        },
                        icon: const Icon(
                          Icons.camera_enhance_rounded,
                          color: Colors.white,
                        ),
                      ),
                    );
                  })),
                  const SizedBox(height: 40),
                  TextFormField(
                    initialValue: provider.person.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Valid name";
                      }
                      provider.person.name = value;
                    },
                    decoration: const InputDecoration(label: Text("name")),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await provider.updatePersonList(isNew);
                          provider.clear();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  )
                ],
              ),
            ),
          ),
        ),
        Consumer<UserDetailsProvider>(builder: ((context, value, child) {
          if (value.isLoading) {
            return const LoadingWidget();
          }
          return Container();
        }))
      ]),
    );
  }
}
