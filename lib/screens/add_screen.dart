

import 'package:all_type_api/screens/api_service.dart';
import 'package:all_type_api/screens/user_req.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
        title: const Text('Add User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  cursorHeight: 23,
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey.shade100,
                    filled: true,
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  cursorHeight: 23,
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey.shade100,
                    filled: true,
                    hintText: 'Age',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //this is a padding
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  cursorHeight: 23,
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey.shade100,
                    filled: true,
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    String name = nameController.text.toString();
                    String email = emailController.text.toString();
                    int age = int.parse(ageController.text.toString());

                    UserReq userReq = UserReq(name: name, email: email, age: age, password: 'password', url: 'https://www.citypng.com/public/uploads/small/11640168385jtmh7kpmvna5ddyynoxsjy5leb1nmpvqooaavkrjmt9zs7vtvuqi4lcwofkzsaejalxn7ggpim4hkg0wbwtzsrp1ldijzbdbsj5z.png');
                    ApiService.postData(userReq).then((value) => Navigator.of(context).pop(true));

                  },
                  child: const Text(
                    'Add User',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
