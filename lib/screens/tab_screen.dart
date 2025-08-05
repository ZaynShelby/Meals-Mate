import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealmate/provider/favourite_provider.dart';
import 'package:mealmate/provider/meals_provider.dart';
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

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = kInitialFilter;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(currentFilters: _selectedFilters),
        ),
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
    final favouriteMeals = ref.watch((favouriteMealsProvider));
    final meals = ref.watch((mealsProvider));
    final availableMeals = meals.where((meal) {
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
    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    var activePageTitle = Text('Categories');

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(meal: favouriteMeals);
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
