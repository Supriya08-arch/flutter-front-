class User {
  String? name;
  String? email;
  String? password;
  String? cPassword;

  User({
    this.name,
    this.email,
    this.password,
    this.cPassword,
  });

  // making user object from json
  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        cPassword: json["cPassword"],
      );

  // converting dart object to json ----> client le server lai falne
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "cPassword": cPassword,
      };
}
