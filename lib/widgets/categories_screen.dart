import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/dummy_data.dart';

import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  final List<Category> dummyData = DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyData
          .map((catData) => CategoryItem(
              id: catData.id, title: catData.title, color: catData.color))
          .toList(),
    );
  }
}
