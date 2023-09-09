class ProfileModel {
  String? username;
  String? email;
  int? phoneNumber;
  String? profileImage;
  String? password;

  ProfileModel(
      {this.username,
        this.email,
        this.phoneNumber,
        this.profileImage,
        this.password});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    profileImage = json['profile_image'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['profile_image'] = this.profileImage;
    data['password'] = this.password;
    return data;
  }
}
