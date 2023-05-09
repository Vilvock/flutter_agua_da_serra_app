import 'package:flutter_agua_da_serra_app/model/global_ws_model.dart';

class User extends GlobalWSModel{
  final String nome;
  final String email;

  User({
    required this.nome,
    required this.email, required super.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      email: json['email'],
      status: json['status'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'status': status,
    };
  }
}