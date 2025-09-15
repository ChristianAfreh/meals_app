import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  Widget _buildSectionTitle(BuildContext ctx, String sectionTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(sectionTitle, style: Theme.of(ctx).textTheme.titleLarge),
    );
  }

  Widget _buildSectionContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  final ingredient = selectedMeal.ingredients[index];
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Text(ingredient),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, "Steps"),
            _buildSectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  final step = selectedMeal.steps[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(step),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
