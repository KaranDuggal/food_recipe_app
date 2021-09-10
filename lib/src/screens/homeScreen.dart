import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipr_app/src/models/recipeListModel.dart';
import 'package:food_recipr_app/src/screens/loadingScreen.dart';
import 'package:food_recipr_app/src/services/apiService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var recipeAPIDATA;
  List<Recipe> recipeList = <Recipe>[];
  bool isApiHit = false;

  Future <void> getRecipes(String recipeName) async  {
    var data = await ApiService().get(recipeName);
    if(data['success']){
      recipeAPIDATA = RecipeList.fromJson(jsonDecode(data['data']));
      isApiHit = true;
      var list = recipeAPIDATA.hits;
      list.forEach((list) {
        recipeList.add(list.recipe);
      });

      setState(() {
        
      });
      // recipeList.forEach((element) {
      //   print(element.label);
      // });
    }
  }
  @override
  void initState() {
    super.initState();
    getRecipes("chicken");
  }
  @override
  Widget build(BuildContext context) {
    if(isApiHit){
      return Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // begin: to,
                  colors: [
                    Colors.red,
                    Colors.orange
                  ],
                )
              ),
            ),
            Column(
              children: [
                SafeArea(
                  child: Container(
                        // color: Colors.grey,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 24
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width:10),
                            GestureDetector(
                              onTap: () async {
                                // if(search.isNotEmpty){
                                //   apiHit = false;
                                //   setState(() {
                                //   });
                                //   await getData("$search");
                                // }
                              },
                              child: Container(child: Icon(Icons.search)),
                            ),
                            SizedBox(width:10),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                // onFieldSubmitted: (value) async{
                                //   if(value.isNotEmpty){
                                //     apiHit = false;
                                //     setState(() {
                                //     });
                                //     await getData("$search");
                                //   }
                                // },
                                decoration: InputDecoration(
                                  hintText: "Search any Recipe",
                                  border: InputBorder.none
                                ),
                                // onChanged: (value){
                                //   search = value;
                                // },
                              )
                            )
                          ],
                        ),
                      ),
                ),
                Container(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("What Do You Want To Cook Today?",style: TextStyle(fontSize: 36),),
                      SizedBox(height: 5,),
                      Text("Let's cook something New!",style: TextStyle(fontSize: 20),),
                    ]
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: recipeList.length,
                    itemBuilder: (context,index){
                      return Text("test");
                    }
                  ),
                )
              ],
            )
          ],
        ),
      );
    }else{
      return LoadingScreen();
    }
  }
}
