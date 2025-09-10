import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealTitle = routeArgs['mealTitle'] as String;
    return Scaffold(
      appBar: AppBar(title: Text(mealTitle)),
      body: Text('Meal Detail Page'),
    );
  }
}
