class Restaurant {
  final String id;
  final String name;
  final String imageName;
  final int rate;
  List<String> dishesID = [];
  List<String> commentsID = [];

  Restaurant(
      {required this.imageName,
      required this.id,
      required this.name,
      required this.rate});

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      imageName: json['imageName'].toString(),
      id: json['id'].toString(),
      name: json['name'].toString(),
      rate: json['rate'],
      // rate: 5,
    );
  }
}
