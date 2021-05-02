import 'package:flutter_test_application/models/DetailsModel.dart';
import 'package:flutter_test_application/models/ItemModel.dart';
import 'package:flutter_test_application/networking/ApiHandler.dart';

class Repository
{
  final ApiHandler apiHandler=ApiHandler();
  Future<ItemModel>featchMovies() => apiHandler.getAllMovies();

  Future<DetailsModel>fetchDetails(id) =>apiHandler.getMovieDetails(id);
}