class UserModel {
  dynamic id;
  dynamic fullName;
  dynamic password;
  dynamic phoneNumber;
  dynamic role;
  dynamic email;

  UserModel({
    this.id,
    this.fullName,
    this.password,
    this.phoneNumber,
    this.role,
    this.email,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        fullName: json["fullName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        email: json["email"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "password": password,
        "phoneNumber": phoneNumber,
        "role": role,
        "email": email,
      };
}
