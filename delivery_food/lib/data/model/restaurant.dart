class Restaurant {
  final int id;
  final String name;
  final String imageName;
  double rate = 5;
  List<String> dishesID = [];
  List<String> commentsID = [];

  Restaurant(
      {required this.imageName,
      required this.id,
      required this.name,
      this.rate = 5});
}
