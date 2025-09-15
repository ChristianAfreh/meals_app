import 'package:flutter/material.dart';

import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          secondary: Colors.amber,
          surface: Color.fromRGBO(255, 254, 229, 1),
        ),
        canvasColor: Colors.white, //Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        // Add this to ensure AppBar uses primary color
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway', // Your custom font
            fontSize: 20,
            //fontWeight: FontWeight.bold,
          ), // Text color on AppBar
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
        ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      //
      // onUnknownRoute: (settings) {
      //   print(settings);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // }, //Works like 404 page on web
    );
  }
}
