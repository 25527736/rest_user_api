import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
  });

  UserClass user;
  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.dob,
    required this.age,
    required this.profilePicture,
    required this.address,
    required this.gender,
  });

  String id;
  String name;
  String email;
  String contactNumber;
  String dob;
  int age;
  String profilePicture;
  String address;
  String gender;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        dob: json["dob"],
        age: json["age"],
        profilePicture: json["profilePicture"],
        address: json["address"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "contactNumber": contactNumber,
        "dob": dob,
        "age": age,
        "profilePicture": profilePicture,
        "address": address,
        "gender": gender,
      };
}
