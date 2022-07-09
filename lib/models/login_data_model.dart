class LogInData {
  String? userName;
  String? email;
  String? password;

  LogInData(
      {required this.userName, required this.email, required this.password});

  LogInData.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
