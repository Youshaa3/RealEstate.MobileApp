class GetAllProfileModel {
  int? id;
  String? password;
  String? lastLogin;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  int? phoneNumber;
  bool? isActive;
  bool? isSuperuser;
  bool? isStaff;
  String? dateJoined;
  String? birthDate;
  bool? receiveNewsletter;
  String? city;
  String? address;
  String? aboutMe;
  String? profileImage;
  List<String>? groups;
  List<String>? userPermissions;

  GetAllProfileModel(
      {this.id,
        this.password,
        this.lastLogin,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.isActive,
        this.isSuperuser,
        this.isStaff,
        this.dateJoined,
        this.birthDate,
        this.receiveNewsletter,
        this.city,
        this.address,
        this.aboutMe,
        this.profileImage,
        this.groups,
        this.userPermissions});

  GetAllProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    isSuperuser = json['is_superuser'];
    isStaff = json['is_staff'];
    dateJoined = json['date_joined'];
    birthDate = json['birth_date'];
    receiveNewsletter = json['receive_newsletter'];
    city = json['city'];
    address = json['address'];
    aboutMe = json['about_me'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['last_login'] = this.lastLogin;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['is_active'] = this.isActive;
    data['is_superuser'] = this.isSuperuser;
    data['is_staff'] = this.isStaff;
    data['date_joined'] = this.dateJoined;
    data['birth_date'] = this.birthDate;
    data['receive_newsletter'] = this.receiveNewsletter;
    data['city'] = this.city;
    data['address'] = this.address;
    data['about_me'] = this.aboutMe;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
