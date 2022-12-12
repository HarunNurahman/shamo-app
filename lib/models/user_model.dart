class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? token;
  String? profilePhotoUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profilePhotoUrl,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "profile_photo_url": profilePhotoUrl,
        "token": token,
      };
}