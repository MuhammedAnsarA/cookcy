class UserModel {
  final String? username;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  UserModel({this.username, this.email, this.photoUrl, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        photoUrl: json["photo_url"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "photo_url": photoUrl,
        "phone_number": phoneNumber,
      };
}
