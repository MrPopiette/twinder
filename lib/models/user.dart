class User {
  final int idUser;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String birthdate;

  User({required this.idUser, required this.firstName, required this.lastName, required this.email, required this.password, required this.birthdate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['mail'],
      password: json['password'],
      birthdate: json['birthdate'],
    );
  }
}
