import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Filters')),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isActive) {
                setState(() {
                  _glutenFreeFilterSet = isActive;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              subtitle: Text(
                'Includes only gluten free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isActive) {
                setState(() {
                  _lactoseFreeFilterSet = isActive;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              subtitle: Text(
                'Includes only lactose free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isActive) {
                setState(() {
                  _veganFilterSet = isActive;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              subtitle: Text(
                'Includes only vegan type meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isActive) {
                setState(() {
                  _vegetarianFilterSet = isActive;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              subtitle: Text(
                'Includes only vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
