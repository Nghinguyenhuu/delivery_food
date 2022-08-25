class User {
  final String? id;
  final String? username;
  final String? password;
<<<<<<< HEAD
  String? email;
  String? firstname;
  String? lastname;
  String? mobilephone;
  String? image;

  User(
=======
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? mobilephone;
  final String? photoUrl;
  const User(
>>>>>>> origin/nghia_dev_feature_chat
      {this.id,
      this.password,
      this.username,
      this.email,
      this.firstname,
      this.lastname,
      this.mobilephone,
<<<<<<< HEAD
      this.image});
=======
      this.photoUrl});
>>>>>>> origin/nghia_dev_feature_chat

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
        id: id,
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        mobilephone: json["mobilephone"],
        image: json["image"],
        username: json["username"],
        password: json["password"],
        photoUrl: json["photoUrl"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobilephone": mobilephone,
      "username": username,
      "password": password,
<<<<<<< HEAD
      "image": image
=======
      "photoUrl": photoUrl
>>>>>>> origin/nghia_dev_feature_chat
    };
  }
}
