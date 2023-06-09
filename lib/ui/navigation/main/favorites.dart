import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_agua_da_serra_app/config/preferences.dart';
import 'package:flutter_agua_da_serra_app/global/application_constant.dart';
import 'package:flutter_agua_da_serra_app/model/favorite.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/res/strings.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';
import 'package:flutter_agua_da_serra_app/ui/components/progress_hud.dart';
import 'package:flutter_agua_da_serra_app/web_service/links.dart';
import 'package:flutter_agua_da_serra_app/web_service/service_response.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _Favorites();
}

class _Favorites extends State<Favorites> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  final postRequest = PostRequest();

  Future<List<Map<String, dynamic>>> listFavorites() async {
    try {
      final body = {
        "id_user": /*await Preferences.getUserData()!.id*/"6",
        "token": ApplicationConstant.TOKEN
      };

      print('HTTP_BODY: $body');

      final json =
          await postRequest.sendPostRequest(Links.LIST_FAVORITES, body);

      List<Map<String, dynamic>> _map = [];
      _map = List<Map<String, dynamic>>.from(jsonDecode(json));

      print('HTTP_RESPONSE: $_map');

      return _map;
    } catch (e) {
      throw Exception('HTTP_ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "Meus Favoritos", isVisibleBackButton: false),
      body: ProgressHUD(
        inAsyncCall: _isLoading,
        valueColor: AlwaysStoppedAnimation<Color>(OwnerColors.colorPrimary),
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: listFavorites(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final responseItem = Favorite.fromJson(snapshot.data![0]);

                if (responseItem.rows != 0) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {


                      final response = Favorite.fromJson(snapshot.data![index]);

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              Dimens.minRadiusApplication),
                        ),
                        margin: EdgeInsets.all(Dimens.minMarginApplication),
                        child: Container(
                          padding: EdgeInsets.all(Dimens.paddingApplication),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: Dimens.minMarginApplication),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimens.minRadiusApplication),
                                      child: Image.network(
                                        ApplicationConstant.URL_PRODUCT_PHOTO + response.url_foto.toString(),
                                        height: 90,
                                        width: 90,
                                        errorBuilder: (context, exception, stackTrack) => Icon(Icons.error, size: 90),
                                      ))),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      response.nome,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: Dimens.textSize6,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                        height: Dimens.minMarginApplication),
                                    Text(
                                      response.descricao,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: Dimens.textSize5,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: Dimens.marginApplication),
                                    Text(
                                      response.valor,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: Dimens.textSize6,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                        height: Dimens.minMarginApplication),
                                    Divider(
                                      color: Colors.black12,
                                      height: 2,
                                      thickness: 1.5,
                                    ),
                                    SizedBox(
                                        height: Dimens.minMarginApplication),
                                    IntrinsicHeight(
                                        child: Row(
                                      children: [
                                        Icon(
                                            size: 20,
                                            Icons.shopping_cart_outlined),
                                        Text(
                                          "Adicionar ao carrinho",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: Dimens.textSize4,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                            width: Dimens.minMarginApplication),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          width: 2,
                                          thickness: 1.5,
                                        ),
                                        SizedBox(
                                            width: Dimens.minMarginApplication),
                                        Icon(size: 20, Icons.delete_outline),
                                        Text(
                                          "Remover",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: Dimens.textSize4,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      _isLoading = true;
      // listFavorites();
      _isLoading = false;
    });
  }
}
