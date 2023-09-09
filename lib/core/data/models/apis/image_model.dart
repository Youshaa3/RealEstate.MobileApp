class ImageModel {
  int? propertyId;
  String? image;

  ImageModel({this.propertyId, this.image});

  ImageModel.fromJson(Map<String, dynamic> json) {
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
