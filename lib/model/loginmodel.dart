class LoginModel {
  int? code;
  bool? status;
  String? token;
  int? userId;
  String? userEmail;

  LoginModel({this.code, this.status, this.token, this.userId, this.userEmail});

  factory LoginModel.fromJson(Map<String, dynamic> obj) {
    return LoginModel(
      code: obj['code'],
      status: obj['status'],
      token: obj['token'],
      userId: obj['userId'],
      userEmail: obj['userEmail'],
    );
  }
}
