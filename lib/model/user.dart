class User {
  final String nome;
  final String email;

  User({
    required this.nome,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
    };
  }
}