class UserModel {
  final String name;
  final String email;
  final String avatar;

  UserModel({required this.name, required this.email, required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['first_name'] + ' ' + json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
