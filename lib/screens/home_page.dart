import 'package:all_type_api/screens/add_screen.dart';
import 'package:all_type_api/screens/api_service.dart';
import 'package:all_type_api/screens/edit_screen.dart';
import 'package:all_type_api/screens/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];
  bool isLoading = true;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    isLoading = true;
    userList = await ApiService.getData();
    userList = userList.reversed.toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          'Users List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              //reverse: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 4),
                      child: Card(
                        elevation: 3,
                        color: Colors.blueGrey.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(userList[index].url)),
                              ),
                              title: Text(
                                userList[index].name,
                                style: const TextStyle(fontSize: 21),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Age:-${userList[index].age}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      userList[index].email,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                              trailing: PopupMenuButton<int>(
                                onSelected: (v) {
                                  if (v == 1) {
                                    String name = userList[index].name;
                                    int age = userList[index].age;
                                    String email = userList[index].email;
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return ShowDetails(
                                        name: name,
                                        age: age,
                                        email: email,
                                        id: userList[index].id,
                                      );
                                    })).then((value) {
                                      if (value) {
                                        getUserData();
                                      }
                                    });
                                  }

                                  if (v == 2) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Do you want to delete this user'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No',style: TextStyle(fontSize: 18),)
                                                ),
                                              const SizedBox(width: 25,),
                                              TextButton(
                                                  onPressed: () {
                                                    String id =
                                                        userList[index].id;
                                                    ApiService.deleteUserById(
                                                            id)
                                                        .then((value) {
                                                      getUserData();
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Yes',style: TextStyle(fontSize: 18),)),
                                            ],
                                          );
                                        });
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.blueGrey.shade900,
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.pink,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Edit',
                                            style:
                                                TextStyle(color: Colors.pink),
                                          )
                                        ],
                                      )),
                                  PopupMenuItem(
                                      value: 2,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.delete,
                                            color: Colors.pink,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Delete',
                                            style:
                                                TextStyle(color: Colors.pink),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const Add();
          })).then((value) {
            if (value != null && value) {
              getUserData();
            }
          });
        },
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
