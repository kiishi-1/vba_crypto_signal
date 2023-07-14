class LoginResponse {
  final String message;

  const LoginResponse({
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"],
    );
  }
  Map<String, dynamic> toJson() => {
        "message": message,
    };
}

