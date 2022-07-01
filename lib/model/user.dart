class User {
  int id;
  String name;
  String email;
  User({required this.id, required this.name, required this.email});
  factory User.fromjson(Map<String, dynamic> parsedjson) {
    return User(id: 0, name: parsedjson["name"], email: parsedjson["email"]);
  }
}
