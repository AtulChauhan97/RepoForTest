


import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class User {
  String id;
  String name;
  String email;
  int age;
  String password;
  String url;
  DateTime createDate;
  DateTime? updateDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.password,
    required this.url,
    required this.createDate,
    this.updateDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    age: json["age"],
    password: json["password"],
    url: json["url"] ?? "https://www.citypng.com/public/uploads/small/11640168385jtmh7kpmvna5ddyynoxsjy5leb1nmpvqooaavkrjmt9zs7vtvuqi4lcwofkzsaejalxn7ggpim4hkg0wbwtzsrp1ldijzbdbsj5z.png",
    createDate: DateTime.parse(json["createDate"]),
    updateDate: json["updateDate"] == null ? DateTime.now() : DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "age": age,
    "password": password,
    "url": url,
    "createDate": createDate.toIso8601String(),
    "updateDate": updateDate?.toIso8601String() ?? "",
  };
}
