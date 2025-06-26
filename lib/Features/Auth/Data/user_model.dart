class UserModel {
  final String name;
  final String email;
  final bool? verified;
  final String uid;

  UserModel(
      {required this.name,
      required this.email,
      this.verified = false,
      required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'verify': verified,
      'id': uid,
    };
  }

  // factory UserModel.fromMap(UserCredential user) {
  //   return UserModel(
  //     uid: user.user!.uid,
  //     email: user.user!.email!,
  //     name: user.user!.displayName!,
  //   );
  // }
}
