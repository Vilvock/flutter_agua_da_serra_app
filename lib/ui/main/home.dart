import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/res/strings.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';
import 'package:flutter_agua_da_serra_app/ui/components/progress_hud.dart';
import 'package:flutter_agua_da_serra_app/ui/main/cart.dart';
import 'package:flutter_agua_da_serra_app/ui/main/favorites.dart';
import 'package:flutter_agua_da_serra_app/ui/main/main_menu.dart';
import 'package:flutter_agua_da_serra_app/ui/main/orders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    ContainerHome(),
    Cart(),
    Orders(),
    Favorites(),
    MainMenu()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar:
          BottomNavBar(currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}

class ContainerHome extends StatefulWidget {
  const ContainerHome({Key? key}) : super(key: key);

  @override
  State<ContainerHome> createState() => _ContainerHomeState();
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  BottomNavBar({this.currentIndex = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: Dimens.elevationApplication,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: OwnerColors.colorPrimary,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Carrinho',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Meus Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_outline),
          label: 'Meus Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Menu Principal',
        ),
      ],
    );
  }
}

class _ContainerHomeState extends State<ContainerHome> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Início", isVisibleBackButton: false),
        body: ProgressHUD(
          inAsyncCall: _isLoading,
          valueColor: AlwaysStoppedAnimation<Color>(OwnerColors.colorPrimary),
          child: RefreshIndicator(
              onRefresh: _pullRefresh,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: /*numbersList.length*/ 2,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimens.minRadiusApplication),
                              ),
                              margin:
                                  EdgeInsets.all(Dimens.minMarginApplication),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.80,
                                padding:
                                    EdgeInsets.all(Dimens.paddingApplication),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 2000,
                      )
                    ],
                  ),
                ),
              )),
        ));
  }

  Future<void> _pullRefresh() async {
    setState(() {
      _isLoading = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sending Message"),
      ));
      _isLoading = false;
    });
  }
}
