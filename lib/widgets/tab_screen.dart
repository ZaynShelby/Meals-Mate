import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';
import 'package:mealmate/screens/categories.dart';
import 'package:mealmate/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _toggleFavouriteMealStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      _favouriteMeals.remove(meal);
    } else {
      _favouriteMeals.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavouriteMeal: _toggleFavouriteMealStatus,
    );
    var activePageTitle = Text('Categories');

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meal: _favouriteMeals,
        toggleFavouriteMeal: _toggleFavouriteMealStatus,
      );
      activePageTitle = Text('Favourites');
    }
    return Scaffold(
      appBar: AppBar(title: activePageTitle),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
