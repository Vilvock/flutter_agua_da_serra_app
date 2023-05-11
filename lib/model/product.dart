import 'package:flutter_agua_da_serra_app/model/global_ws_model.dart';

class Product extends GlobalWSModel{
  final String nome;
  final String email;
  final String url_foto;
  final String descricao;

  Product({
    required this.nome,
    required this.email,
    required this.url_foto,
    required this.descricao, required super.status, required super.msg, required super.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      nome: json['nome'],
      email: json['email'],
      url_foto: json['url_foto'],
      descricao: json['descricao'],
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
      'url_foto': url_foto,
      'descricao': descricao,
      'status': status,
      'msg': msg,
      'id': id,
    };
  }
}