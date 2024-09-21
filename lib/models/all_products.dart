class Productmodel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Ratingmodel rating;
  Productmodel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:  Ratingmodel.fromJson(json['rating']),
    );
  }
}

class Ratingmodel {
  final dynamic rate;
  final dynamic count;
  Ratingmodel({required this.rate, required this.count});
  factory Ratingmodel.fromJson(json) {
    return Ratingmodel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
