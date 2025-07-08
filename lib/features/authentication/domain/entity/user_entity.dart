class UserEntity{
  final String uid;
  final String email;
  final String userName;
  final bool isEmailVerified;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.userName,
    required this.isEmailVerified,
  });
}