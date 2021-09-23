import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './widgets/categories_screen.dart';
import './widgets/category_meals_screen.dart';
import './widgets/meal_detail_screen.dart';
import './widgets/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                    fontSize: 18,
                  )))),
      home: TabsScreen(),
      routes: {
        // '/' : (ctx) => TabsScreen(),
        // '/category-meals': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
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
