import "package:cloud_firestore/cloud_firestore.dart";

class User {
  final String id;
  final String name;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
      };

  static User fromSnap(DocumentSnapshot e) {
    var snap = e.data() as Map<String, dynamic>;

    return User(
      id: snap["id"],
      name: snap["name"],
      email: snap["email"],
      password: snap["password"],
    );
  }
}
