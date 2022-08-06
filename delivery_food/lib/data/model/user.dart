class User {
  final int? id;
  final String username;
  final String password;
  final String email;
  final String? firstname;
  final String? lastname;
  final String? mobilephone;

  const User(
      {this.id,
      required this.password,
      required this.username,
      required this.email,
      this.firstname,
      this.lastname,
      this.mobilephone});
}
