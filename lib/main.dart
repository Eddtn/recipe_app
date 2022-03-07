import 'package:flutter/material.dart';
import 'package:recipes/recipes.dart';
import 'recipe_detail.dart';

import 'recipes.dart';

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(

        primaryColor: Colors.white,
        // accentColor: Colors.black
      ),
      home: const MyHomePage(title: 'Recipe calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

     body: SafeArea(
       child: ListView.builder(
         itemCount:  Recipe.samples.length,
         itemBuilder: (BuildContext context, int index) {
           return GestureDetector (
             onTap: () {
               Navigator.push(context,
               MaterialPageRoute(
                 builder: (context)  {

                 return RecipeDetail(recipe: Recipe.samples[index]);
               }
               ),
               );
             },
               child: buildRecipeCard( Recipe.samples[index]));
         },
       ),
     ),
    );
  }
}




Widget buildRecipeCard(Recipe recipe) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children:  [
          Image(image: AssetImage(recipe.imageurl)),
          const SizedBox(height: 14.0,),
          Text(recipe.label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'palatino',
          ),),
        ]
      ),
    ),
  );
}