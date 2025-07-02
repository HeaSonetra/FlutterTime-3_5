class Resmodelservice {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;

  Resmodelservice({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Resmodelservice.fromJson(Map<String,dynamic>  json){
    return Resmodelservice(
      id: json["id"] ?? 0, 
      title: json["title"] ?? "", 
      price: json["price"] ?? 0.0, 
      description: json["description"] ?? "", 
      category: json["category"] ?? "", 
      image: json["image"] ?? "", 
      rating: Rating(
        rate: json["rate"] ?? 0,
        count: json["count"]?? 0,
      )
    );
  }
}

class Rating {
  dynamic rate;
  int count;

  Rating({required this.count, required this.rate});
}
