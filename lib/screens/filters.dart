import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealmate/provider/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filterProvider);
    _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
    _veganFilterSet = activeFilter[Filter.vegan]!;
    _vegetarianFilterSet = activeFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Filters')),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          Navigator.of(context).pop();
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
