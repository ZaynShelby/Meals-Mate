import 'package:flutter/material.dart';
import 'package:mealmate/data/dummy_data.dart';
import 'package:mealmate/models/meal.dart';
import 'package:mealmate/screens/categories.dart';
import 'package:mealmate/screens/filters.dart';
import 'package:mealmate/screens/meals.dart';
import 'package:mealmate/widgets/main_drawer.dart';

final kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = kInitialFilter;

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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => FilterScreen()),
      );
      setState(() {
        _selectedFilters = results ?? kInitialFilter;
      });
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => TabScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && meal.vegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && meal.vegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      toggleFavouriteMeal: _toggleFavouriteMealStatus,
      availableMeals: availableMeals,
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
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
