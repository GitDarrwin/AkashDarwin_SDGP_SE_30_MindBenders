class UserModel {
  final String? id;
  final String fullname;
  final String email;

  const UserModel({
    this.id,
    required this.email,
    required this.fullname,
  });

  toJson() {
    return {
      "Name": fullname,
      "Email": email,
    };
  }
}
