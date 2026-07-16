class BikeModel {
  final int id;
  final String title;
  final double pricePerDay;
  final String description;
  final String image;
  final double rating;
  final int reviewCount;
  final bool isAvailable;

  BikeModel({
    required this.id,
    required this.title,
    required this.pricePerDay,
    required this.description,
    required this.image,
    required this.rating,
    required this.reviewCount,
    this.isAvailable = true,
  });

  factory BikeModel.fromJson(Map<String, dynamic> json) {
    return BikeModel(
      id: json['id'] as int,
      title: json['title'] as String,
      pricePerDay: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      image: json['image'] as String,
      rating: (json['rating']['rate'] as num).toDouble(),
      reviewCount: json['rating']['count'] as int,
      isAvailable: json['id'] % 3 != 0, // Mocking some as unavailable for UI variance
    );
  }
}
