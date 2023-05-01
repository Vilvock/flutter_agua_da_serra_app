import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agua_da_serra_app/res/dimens.dart';
import 'package:flutter_agua_da_serra_app/res/owner_colors.dart';
import 'package:flutter_agua_da_serra_app/res/strings.dart';
import 'package:flutter_agua_da_serra_app/ui/components/custom_app_bar.dart';
import 'package:flutter_agua_da_serra_app/ui/components/dot_indicator.dart';
import 'package:flutter_agua_da_serra_app/ui/components/progress_hud.dart';
import 'package:flutter_agua_da_serra_app/ui/main/cart.dart';
import 'package:flutter_agua_da_serra_app/ui/main/favorites.dart';
import 'package:flutter_agua_da_serra_app/ui/main/main_menu.dart';
import 'package:flutter_agua_da_serra_app/ui/main/orders.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
  int _pageIndex = 0;

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
                      CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                          height: 160,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _pageIndex = index;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              carouselItems.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: DotIndicator(
                                        isActive: index == _pageIndex,
                                        color: OwnerColors.colorPrimaryDark),
                                  )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimens.marginApplication,
                            right: Dimens.marginApplication),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Destaques",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: Dimens.textSize6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Ver mais",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: Dimens.textSize5,
                                color: OwnerColors.colorPrimaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: /*numbersList.length*/ 5,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimens.minRadiusApplication),
                            ),
                            margin: EdgeInsets.all(Dimens.minMarginApplication),
                            child: Container(
                              padding:
                                  EdgeInsets.all(Dimens.paddingApplication),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: Dimens.minMarginApplication),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.minRadiusApplication),
                                          child: Image.asset(
                                            'images/person.jpg',
                                            height: 90,
                                            width: 90,
                                          ))),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Strings.shortLoremIpsum,
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
                                            height:
                                                Dimens.minMarginApplication),
                                        Text(
                                          Strings.longLoremIpsum,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: Dimens.textSize5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                            height: Dimens.marginApplication),
                                        Text(
                                          "Ver detalhes",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: Dimens.textSize5,
                                            color: OwnerColors.colorPrimaryDark,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                Dimens.minMarginApplication),
                                        Divider(
                                          color: Colors.black12,
                                          height: 2,
                                          thickness: 1.5,
                                        ),
                                        SizedBox(
                                            height:
                                                Dimens.minMarginApplication),
                                        Text(
                                          "Em andamento",
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: Dimens.textSize5,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimens.marginApplication,
                            left: Dimens.marginApplication,
                            right: Dimens.marginApplication),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Outras ofertas",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: Dimens.textSize6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: gridlItems,
                        ),
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

final List<Widget> carouselItems = [
  CarouselItemBuilder(image: 'images/banner1_image.jpg'),
  CarouselItemBuilder(image: 'images/banner2_image.jpg'),
];

class CarouselItemBuilder extends StatelessWidget {
  final String image;

  const CarouselItemBuilder({Key? key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.minRadiusApplication),
        ),
        margin: EdgeInsets.all(Dimens.minMarginApplication),
        child: Container(
          /*width: MediaQuery.of(context).size.width * 0.90,*/
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
  }
}

final List<Widget> gridlItems = [
  GridItemBuilder(image: ''),
  GridItemBuilder(image: ''),
  GridItemBuilder(image: ''),
  GridItemBuilder(image: ''),
  GridItemBuilder(image: ''),
  GridItemBuilder(image: ''),
];

class GridItemBuilder extends StatelessWidget {
  final String image;

  const GridItemBuilder({Key? key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.minRadiusApplication),
        ),
        margin: EdgeInsets.all(Dimens.minMarginApplication),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(right: Dimens.minMarginApplication),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.minRadiusApplication),
                        child: Image.asset(
                          'images/person.jpg',
                          height: 90,
                          width: double.infinity,
                        ))),
                SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {
                    },
                    starCount: 5,
                    rating: 2,
                    size: 20.0,
                    isReadOnly:true,
                    filledIconData: Icons.blur_off,
                    halfFilledIconData: Icons.blur_on,
                    color: Colors.green,
                    borderColor: Colors.green,
                    spacing:0.0
                ),
                Text(
                  Strings.longLoremIpsum,
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
                  "50,00",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: Dimens.textSize6,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
