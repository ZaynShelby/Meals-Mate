import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (ctx, index) => Text(meal[index].title),
    );
    if (meal.isEmpty) {
      Center(
        child: Column(
          children: [Text('This Category is empty Try another one')],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
