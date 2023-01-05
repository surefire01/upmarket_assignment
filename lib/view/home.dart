import 'package:flutter/material.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:upmarket_assignment/utils/user_list_tile.dart';
import 'package:upmarket_assignment/view/add_person_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: ((context, index) {
            Person person = Person();
            person.name = "asdasd hjgk";

            return UserListTile(person: person);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPersonView(
                        screenTitle: "Add Person",
                      )));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
