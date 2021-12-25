import 'dart:convert';

import 'package:discover_app/models/places_model.dart';
import 'package:http/http.dart' as http;

class HttpHelper{
  String baseUrl='http://mark.bslmeiyu.com/api';
   Future<List<PlacesModel>> getData() async{
    var apiUrl='/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    print(json.decode(res.body));
    try{
      if(res.statusCode==200){
        List<dynamic> list=json.decode(res.body);
        return list.map((e)=>PlacesModel.fromJson(e)).toList();
      }
      else{
        return <PlacesModel>[];
      }
    }catch(e){
      print(e);
      return <PlacesModel>[];
    }

  }
}