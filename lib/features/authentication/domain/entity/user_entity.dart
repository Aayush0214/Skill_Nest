class UserEntity{
  final String uid;
  final String email;
  final String username;
  final bool isEmailVerified;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.username,
    required this.isEmailVerified,
  });
}