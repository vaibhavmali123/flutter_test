
import 'dart:convert';

import 'package:flutter_test_application/models/DetailsModel.dart';
import 'package:flutter_test_application/models/ItemModel.dart';
import 'package:flutter_test_application/networking/ApiProvider.dart';
import 'package:flutter_test_application/networking/EndPoints.dart';
import 'package:http/http.dart'as http;
class ApiHandler
{
  static var client=http.Client();
  
   Future<ItemModel>getAllMovies()async{
    
    var response=await client.get(ApiProvider.baseUrl+EndPoints.movies);
    print("RESPONSE ${response.body.toString()}");
    if (response.statusCode==200 || response.statusCode==201) {
      return ItemModel.fromJson(json.decode(response.body));
    }
  }

  Future<DetailsModel>getMovieDetails(int id)async{
     var response=await client.get(ApiProvider.baseUrl+EndPoints.movies+'/'+id.toString());
     print("RESPONSE ${response.body.toString()}");

     if (response.statusCode==200 || response.statusCode==201) {

       return DetailsModel.fromJson(json.decode(response.body));
     }
  }
}