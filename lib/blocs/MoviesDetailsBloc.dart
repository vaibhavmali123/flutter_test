import 'package:flutter_test_application/models/DetailsModel.dart';
import 'package:flutter_test_application/networking/Repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesDetailsBloc
{
  int id;

  MoviesDetailsBloc({this.id});

  final repository=Repository();

  final movieId=PublishSubject<int>();

  final moviesDetailController=PublishSubject<DetailsModel>();

  Observable<DetailsModel> get moviesDetailsStream=>moviesDetailController.stream;

fetchMovieDetails()async
{
DetailsModel detailsModel=await repository.fetchDetails(id);
moviesDetailController.sink.add(detailsModel);
}
}
