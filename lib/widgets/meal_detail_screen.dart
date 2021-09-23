import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/meal-detail';

  Widget _buildTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildSection(Widget child) {
    return Container(
      height: 180,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle(context, 'Ingredients'),
            _buildSection(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${selectedMeal.ingredients[index]}',
                          textAlign: TextAlign.center,
                        ),
                      ));
                })),
            _buildTitle(context, 'Steps'),
            _buildSection(
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text('${index + 1}'),
                          ),
                          title: Text('${selectedMeal.steps[index]}'),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
