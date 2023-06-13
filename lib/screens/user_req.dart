class UserReq {
  String name;
  String email;
  int age;
  String password;
  String url;

  UserReq({
    required this.name,
    required this.email,
    required this.age,
    required this.password,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "age": age,
    "password": password,
    "url": url,
  };
}
