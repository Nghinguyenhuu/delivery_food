class User {
  final String? id;
  final String? username;
   String? password;
  String? email;
  String? firstname;
  String? lastname;
  String? mobilephone;
  String? image;

  User(
      {this.id,
      this.password,
      this.username,
      this.email,
      this.firstname,
      this.lastname,
      this.mobilephone,
      this.image});

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
        id: id,
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        mobilephone: json["mobilephone"],
        image: json["image"],
        username: json["username"],
        password: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobilephone": mobilephone,
      "username": username,
      "password": password,
      "image": image
    };
  }
}
