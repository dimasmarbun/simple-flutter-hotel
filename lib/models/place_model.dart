class Place {
  final int id;
  final String image;
  final String category; // 'room' or 'hall'
  final String type;
  final String name;
  final List<String> facilities;
  final double rating;
  final double price;

  Place({
    required this.id,
    required this.image,
    required this.category,
    required this.type,
    required this.name,
    required this.facilities,
    required this.rating,
    required this.price,
  });
}
