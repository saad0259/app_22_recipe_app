import 'package:app_22_recipe_app/models/meal.dart';
import 'package:flutter/material.dart';

import 'meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites!',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imgUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
