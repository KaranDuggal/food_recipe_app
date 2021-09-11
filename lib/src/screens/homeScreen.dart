import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipr_app/src/models/recipeListModel.dart';
import 'package:food_recipr_app/src/screens/loadingScreen.dart';
import 'package:food_recipr_app/src/screens/recipeViewScreen.dart';
import 'package:food_recipr_app/src/services/apiService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var recipeAPIDATA;
  bool isApiHit = false;
  String search = "";

  Future <void> getRecipes(String recipeName) async  {
    var data = await ApiService().get(recipeName);
    if(data['success']){
      recipeAPIDATA = RecipeList.fromJson(jsonDecode(data['data']));
      isApiHit = true;
      setState(() {
        
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getRecipes("pasta");
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
                  colors: [
                    Colors.red,
                    Colors.orange
                  ],
                )
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                                  if(search.isNotEmpty){
                                      isApiHit = false;
                                      setState(() {
                                      });
                                      await getRecipes(search);
                                    }
                                },
                                child: Container(child: Icon(Icons.search)),
                              ),
                              SizedBox(width:10),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) async{
                                    if(value.isNotEmpty){
                                      isApiHit = false;
                                      setState(() {
                                      });
                                      await getRecipes(value);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search any Recipe",
                                    border: InputBorder.none
                                  ),
                                  onChanged: (value){
                                    search = value;
                                  },
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
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipeAPIDATA.hits.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Container(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeViewScreen("${recipeAPIDATA.hits[index].recipe.url}")));
                            },
                            child: Card(
                              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)
                              ),
                              elevation: 0.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.network('${recipeAPIDATA.hits[index].recipe.image}',fit: BoxFit.cover,height: 100,width: 200,),
                                  ),
                                  Positioned(
                                    left: 0,right: 0,top: 0,bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black45
                                        ,borderRadius: BorderRadius.circular(18)
                                      ),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center
                                        ,
                                        children: [
                                          Text("${recipeAPIDATA.hits[index].recipe.label}",style: TextStyle(fontSize: 20,color: Colors.white
                                          ),)
                                        ],
                                      )
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recipeAPIDATA.hits.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeViewScreen("${recipeAPIDATA.hits[index].recipe.url}")));
                          },
                          child : Card(
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  child: Image.network('${recipeAPIDATA.hits[index].recipe.image}',fit: BoxFit.cover,width: double.infinity,height: 300,),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    // width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25), 
                                      )
                                    ),
                                    child: Text(
                                      '${recipeAPIDATA.hits[index].recipe.label}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  width: 80,
                                  height: 25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(25)
                                      )
                                    ),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.local_fire_department,size: 15,),
                                          Text('${recipeAPIDATA.hits[index].recipe.calories.toString().substring(0,6)}'),
                                        ],
                                      ),
                                    ),
                                  )
                                )
                              ],
                            ),
                          )
                        );
                      }
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }else{
      return LoadingScreen();
    }
  }
}
