import 'package:app_22_recipe_app/models/dummy_data.dart';
import 'package:app_22_recipe_app/models/meal.dart';
import 'package:app_22_recipe_app/widgets/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './widgets/category_meals_screen.dart';
import './widgets/meal_detail_screen.dart';
import './widgets/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'vegetarian': false,
    'vegan': false,
    'lactose-free': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten-free']! && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose-free']! && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex.isNegative) {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color(0xffffeeee),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color(0xff112222)),
                bodyText2: TextStyle(color: Color(0xff112222)),
                headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  //color: Colors.black,
                ),
                // button: TextStyle(
                //   color: Colors.yellow,
                // )
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: const TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                  )))),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        // '/category-meals': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        Filters.routeName: (ctx) => Filters(_setFilters, _filters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => TabsScreen(_favoriteMeals));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen(_favoriteMeals));
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final dynamic appBar = Platform.isIOS
//         ? CupertinoNavigationBar(
//       middle: const Text("Recipe App"),
//       leading: const Icon(CupertinoIcons.settings_solid),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           GestureDetector(
//             child: const Icon(CupertinoIcons.add),
//             onTap: () => (){},
//           )
//         ],
//       ),
//     )
//         : AppBar(
//       title: const Text("Recipe App"),
//       leading: Icon(Icons.menu),
//       centerTitle: true,
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.add),
//         )
//       ],
//     );
//     return Scaffold(
//         appBar: appBar,
//         body: CategoriesScreen(),
//     );
//   }
// }
//
