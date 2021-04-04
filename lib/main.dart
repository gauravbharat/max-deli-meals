import 'package:deli/pages/categories_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: MaterialColor(
            0xFF004643,
            <int, Color>{
              50: Color.fromRGBO(0, 70, 67, .1),
              100: Color.fromRGBO(0, 70, 67, .2),
              200: Color.fromRGBO(0, 70, 67, .3),
              300: Color.fromRGBO(0, 70, 67, .4),
              400: Color.fromRGBO(0, 70, 67, .5),
              500: Color.fromRGBO(0, 70, 67, .6),
              600: Color.fromRGBO(0, 70, 67, .7),
              700: Color.fromRGBO(0, 70, 67, .8),
              800: Color.fromRGBO(0, 70, 67, .9),
              900: Color.fromRGBO(0, 70, 67, 1),
            },
          ),
          accentColor: Color(0xFFf9bc60),
          // cardColor: Color(0xFFabd1c6),
          highlightColor: Color(0xFFf9bc60),
          canvasColor: Color(0xFFabd1c6),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color(0xFF001e1d)),
              headline6: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                // fontWeight: FontWeight.bold,
              )),
          buttonTheme: ButtonThemeData()
          // primarySwatch: Colors.green,
          ),
      home: CategoriesPage(),
    );
  }
}