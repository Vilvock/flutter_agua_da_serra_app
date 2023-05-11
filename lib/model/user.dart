import 'package:flutter_agua_da_serra_app/model/global_ws_model.dart';

class User extends GlobalWSModel{
  final String nome;
  final String email;

  User({
    required this.nome,
    required this.email, required super.status, required super.msg, required super.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome'],
      email: json['email'],
      status: json['status'],
      msg: json['msg'],
      id: json['id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'status': status,
      'msg': msg,
      'id': id,
    };
  }
}