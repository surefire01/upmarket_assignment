import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:upmarket_assignment/model/person_model.dart';
import 'package:upmarket_assignment/services/authentication_service.dart';
import 'package:upmarket_assignment/services/list_update_service.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';
import 'package:upmarket_assignment/utils/user_list_tile.dart';
import 'package:upmarket_assignment/view/add_person_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await AuthenticationService.logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        title: const Text("Home"),
      ),
      body: StreamBuilder<List<Person>>(
          initialData: const [],
          stream: ListUpdateService.personList,
          builder: (context, snapshot) {
            List<Person> list = [];
            if (snapshot.hasData) {
              list = snapshot.data!;
            }
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return Slidable(
                      key: Key(list[index].docId!),
                      endActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            onDismissed: () async {
                              ListUpdateService.deletePerson(list[index]);
                              showToastMsg("user deleted");
                            },
                          ),
                          motion: BehindMotion(),
                          children: [
                            SlidableAction(
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                label: "Delete",
                                onPressed: ((context) {}))
                          ]),
                      child: UserListTile(person: list[index]));
                }));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPersonView(
                        screenTitle: "Add Person",
                      )));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
