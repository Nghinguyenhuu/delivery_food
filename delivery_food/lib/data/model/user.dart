class User {
  final String? id;
  final String? username;
  final String? password;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? mobilephone;

  const User(
      {this.id,
      this.password,
      this.username,
      this.email,
      this.firstname,
      this.lastname,
      this.mobilephone});

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
        id: id,
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        mobilephone: json["mobilephone"],
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
      "password": password
    };
  }
}
