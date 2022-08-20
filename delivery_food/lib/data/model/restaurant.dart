class Restaurent {
  final String id;
  final String name;
  final String imageName;
  double rate = 5;
  List<String> dishesID = [];
  List<String> commentsID = [];

  Restaurent(
      {required this.imageName,
      required this.id,
      required this.name,
      this.rate = 5});

  static Restaurent fromJson(Map<String, dynamic> json) {
    return Restaurent(
      imageName: json['imageName'].toString(),
      id: json['id'].toString(),
      name: json['name'].toString(),
    );
  }
}
