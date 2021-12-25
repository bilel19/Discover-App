class PlacesModel{
  String? name;
  String? img;
  String? description;
  int? price;
  int? stars;
  int? people;
  String? location;

  PlacesModel({
    required this.name,
    required this.img,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.location,
  });


  PlacesModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    img=json['img'];
    description=json['description'];
    price=json['price'];
    stars=json['stars'];
    people=json['people'];
    location=json['location'];
  }
}