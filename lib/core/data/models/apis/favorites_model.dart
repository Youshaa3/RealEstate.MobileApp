class FavoritesModel {
  int? id;
  int? user;
  Item? item;

  FavoritesModel({this.id, this.user, this.item});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    item = (json['item'] != null ? new Item.fromJson(json['item']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  int? user;
  String? name;
  int? price;
  bool? sell;
  String? description;
  String? city;
  String? region;
  List<Image>? image;

  Item(
      {this.user,
        this.name,
        this.price,
        this.sell,
        this.description,
        this.city,
        this.region,
        this.image});

  Item.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    price = json['price'];
    sell = json['sell'];
    description = json['description'];
    city = json['city'];
    region = json['region'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['name'] = this.name;
    data['price'] = this.price;
    data['sell'] = this.sell;
    data['description'] = this.description;
    data['city'] = this.city;
    data['region'] = this.region;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  int? propertyId;
  String? image;

  Image({this.propertyId, this.image});

  Image.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_id'] = this.propertyId;
    data['image'] = this.image;
    return data;
  }
}
