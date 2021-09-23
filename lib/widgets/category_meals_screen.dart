import 'package:app_22_recipe_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String catID;
  // final String catTitle;
  //
  // const CategoryMealsScreen({Key? key,required this.catID,required this.catTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(catId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imgUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
