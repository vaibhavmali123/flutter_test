import 'package:flutter_test_application/networking/Repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_test_application/models/ItemModel.dart';

class MoviesBloc {
  final moviesController = PublishSubject<ItemModel>();

  final repository = Repository();

  Observable<ItemModel> get allMoviesStream => moviesController.stream;

  fetchMovies() async {
    ItemModel itemModel = await repository.featchMovies();

    moviesController.sink.add(itemModel);
    print("RES d ${itemModel.data.movies.length}");

  }
}

final moviesBloc = MoviesBloc();
