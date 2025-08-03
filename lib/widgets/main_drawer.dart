import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onCategoryPage});

  final void Function() onCategoryPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.set_meal, size: 70, color: Colors.black87),
                Text(
                  'Cooking Fever',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: Colors.black87),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onCategoryPage();
            },
            title: Text(
              'Category',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            leading: Icon(Icons.category, size: 30),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            leading: Icon(Icons.settings, size: 30),
          ),
        ],
      ),
    );
  }
}
