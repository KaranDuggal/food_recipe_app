// import 'package:dio/dio.dart';
import 'package:food_recipr_app/src/utils/constant.dart';
import 'package:http/http.dart' as http;
class ApiService{
  // var dio =  Dio();
  // post(_url,data) async {
  //   Response apiData = await dio.post('${MyConstant.localBaseURL}}$_url',data: data);
  //   return apiData.data;
  // }
  get(_url) async {
    // print('${MyConstant.localBaseURL}$_url');
    var apiData = await http.get(Uri.parse('${MyConstant.recipeBaseURL}$_url'));
    if(apiData.statusCode == 200){
      return {"success":true,"data":apiData.body};
    }else{
      return {"success":false};
    }
    // print(apiData.statusCode);
    // return(apiData.body);
  }
}
