class UserModel {
  UserModel({
    this.name,
    this.email,
    this.uId,
    this.token,
  });
  String? name;
  String? email;
  String? uId;
  String? token;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uId'] = uId;

    return data;
  }
}
