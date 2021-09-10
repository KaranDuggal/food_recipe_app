import 'package:flutter/material.dart';

class MyColors {
  static const red = Colors.red;
}
class MyConstant {
  // static const localBaseURL = 'http://192.168.242.239:3001/api/mobile/';
  // static const localBaseURL = 'http://e5af02260723.ngrok.io/api/mobile/';
  static const localBaseURL = 'https://api.openweathermap.org/data/2.5/weather?appid=92b5f550214dd4ab9ba1aff91d2f9f0e&units=metric&q=';
  static const recipeBaseURL = 'https://api.edamam.com/search?app_id=d48881a5&app_key=966da3ca6c0a8d0c9764beafc3c0c62c&q=chicken';
  
}
// https://api.openweathermap.org/data/2.5/weather?q=${cityVal}&units=metric&appid=92b5f550214dd4ab9ba1aff91d2f9f0e