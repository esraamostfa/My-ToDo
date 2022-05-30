
class UserModel {
   late String name;
   late String email;
   late String uId;
   late bool isEmailVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.isEmailVerified,
  }
      );

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}