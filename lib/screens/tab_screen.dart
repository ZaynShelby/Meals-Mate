import 'package:flutter/material.dart';
import 'package:mealmate/models/meal.dart';
import 'package:mealmate/screens/categories.dart';
import 'package:mealmate/screens/meals.dart';
import 'package:mealmate/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavouriteMealStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      _favouriteMeals.remove(meal);
      _showInfoMessage('Meals Removed to Favourites !');
    } else {
      _favouriteMeals.add(meal);
      _showInfoMessage('Meals Added as Favourites !');
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _chosenPage() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => TabScreen()));
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
      drawer: MainDrawer(onCategoryPage: _chosenPage),
      appBar: AppBar(title: activePageTitle, centerTitle: true),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
        ],
      ),
    );
  }
}
