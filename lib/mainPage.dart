import 'package:flutter/material.dart';  
import 'package:kdf/film/scoped_models/app_model.dart';
import 'package:kdf/film/widgets/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

class KdfApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => MaterialApp(
            title: 'Kdf',
            theme: model.theme,
            home: MyApp(),
          ),
    );
  }
}
Widget build(BuildContext context) {
  return Material(
    color: Colors.white,
    child: Center(
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.lightBlue,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.android),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    ),
  );
}
// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget{
//  @override
//   State<StatefulWidget> createState() {
//     return MyAppState();
//   }
// }

// class MyAppState extends State<MyApp> {
//   int _selectedPage = 0;
//   final _pageOptions = [
//     HomePage(),
//     Swap(),
//     Login()
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kdf',
//       theme: ThemeData(  
//         primarySwatch: Colors.orange,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: Text("Kdf"),),
//         body: _pageOptions[_selectedPage],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedPage,
//           onTap: (int index){
//             setState(() {
//                         _selectedPage = index;
//                          });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon:Icon(FontAwesomeIcons.home),
//               title: Text('Anasayfa'),
//               backgroundColor: Theme.of(context).primaryColor,
//             ),
//             BottomNavigationBarItem(
//               icon:Icon(FontAwesomeIcons.searchPlus),
//               title: Text('Keşfet'),
//               backgroundColor: Theme.of(context).primaryColor,
//             ),
//             BottomNavigationBarItem(
//               icon:Icon(FontAwesomeIcons.user),
//               title: Text('Giriş'),
//               backgroundColor: Theme.of(context).primaryColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
 
 