// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:igam/ui/add_consultation_one.dart';
// import 'package:igam/ui/consultations.dart';
// import 'package:igam/ui/detail_consultation.dart';
// import 'package:igam/ui/my_notifications.dart';
// import 'package:igam/ui/note_tec.dart';
// import 'package:igam/ui/podcast.dart';
//
// import '../HttpRequest.dart';
// import '../WSConstants.dart';
// import 'info_tec.dart';
// import 'menu.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   int _selectedIndex = 0;
//   List<Widget> _widgetOptions = [
//     ContainerHome(),
//     ContainerConsultations(),
//     ContainerPodCast(),
//     ContainerInfoTec(),
//     ContainerNoteTec()
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       print(_selectedIndex);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Color(0xff15478E),
//       statusBarBrightness: Brightness.light,
//     ));
//
//     return Scaffold(
//       appBar: CustomAppBar(),
//       backgroundColor: Color(0xffF1F3F7),
//       body: _widgetOptions.elementAt(_selectedIndex),
//       floatingActionButton: Visibility(
//         visible: _selectedIndex == 0,
//         child: FloatingActionButton.extended(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => AddConsultationOne()));
//           },
//           label: Text("CONSULTAS"),
//           icon: Icon(Icons.add),
//           backgroundColor: Color(0xff15478E),
//           elevation: 10,
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(
//           currentIndex: _selectedIndex, onTap: _onItemTapped),
//     );
//   }
// }
//
// class ContainerHome extends StatefulWidget {
//   const ContainerHome({Key? key}) : super(key: key);
//
//   @override
//   State<ContainerHome> createState() => _ContainerHomeState();
// }
//
// class _ContainerHomeState extends State<ContainerHome> {
//   List<dynamic> _cryptos = [];
//
//   Future<void> _loadCryptoData() async {
//     final response = await HttpRequestA(WSConstants.URL_BASE).get(
//         'coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false');
//     setState(() {
//       _cryptos = response;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     //  _loadCryptoData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   // Navigator.pushNamed(context, "/ui/login");
//                   //Aqui vai para listagem de videos
//                 },
//                 child: Text(
//                   "Todos",
//                   style: TextStyle(
//                       color: Color(0xff15478E), fontFamily: 'Poppins'),
//                 ),
//                 style: ButtonStyle(),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 150,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//                 ItensListGeneric(),
//               ],
//             ),
//           ),
//           Column(
//             children: const [
//               Padding(
//                 padding: EdgeInsets.only(left: 16, top: 16),
//                 child: Text(
//                   "Ultimas consultas",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xff2C5999),
//                       fontSize: 15),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 6,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 20,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // ação a ser executada quando o item for clicado
//                       print('Item $index clicado!');
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => DetailConsultation())); // AQUI E ESTA UM EXEMPLO DE IR PARA TELA DIFERENTE DA ROTAS
//
//                     },
//                     child: ItensChamada(),
//                   );
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Color(0xff2C5999),
//       elevation: 5,
//       titleSpacing: 0,
//       automaticallyImplyLeading: false,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 // Aqui vai pra menu
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.blue.withOpacity(0.4),
//                     width: 2.0,
//                   ),
//                 ),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage('images/imaage.png'),
//                   radius: 20,
//                 ),
//               ),
//             ),
//           ),
//           Image.asset(
//             'images/logo_white.png',
//             height: 40,
//             width: 80,
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.notifications_outlined,
//               color: Colors.white,
//             ),
//             onPressed: () {
//
//               Navigator.push(context, MaterialPageRoute(builder: (context) => MyNotifications()));
//
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
//
// class MyBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;
//
//   MyBottomNavigationBar({this.currentIndex = 0, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 5,
//       currentIndex: currentIndex,
//       onTap: onTap,
//       backgroundColor: Colors.white,
//       selectedItemColor: Color(0xff2C5999),
//       unselectedItemColor: Colors.grey,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_filled),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.bookmark_rounded),
//           label: 'Consultas',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.podcasts_rounded),
//           label: 'Podcast',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.file_copy_rounded),
//           label: 'Informativos Tecnicos',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.note),
//           label: 'Notas Tecnicas',
//         ),
//       ],
//     );
//   }
// }
//
// class ItensListGeneric extends StatelessWidget {
//   const ItensListGeneric({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     'images/play.jpg',
//                     width: 180.0,
//                     height: 120.0,
//                     fit: BoxFit.cover,
//                   ),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ItensChamada extends StatelessWidget {
//   const ItensChamada({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16.0),
//                       ),
//                       color: Color(0xffF1F3F7),
//                       child: Padding(
//                         padding: EdgeInsets.all(8),
//                         child: Image.asset(
//                           'images/doc.png',
//                           height: 50,
//                           width: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Cod: 000-2023",
//                         style: TextStyle(color: Color(0xff2C5999)),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Consulta",
//                         style: TextStyle(color: Color(0xff2C5999)),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Text(
//                         "13/01/2023",
//                         style: TextStyle(color: Color(0xff2C5999)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 8, bottom: 40),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Text(
//                   'Em Análise',
//                   style: TextStyle(color: Color(0xfff57f17)),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
