class DetailsModel {
  int statusCode;
  String message;
  Data data;

  DetailsModel({this.statusCode, this.message, this.data});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Movie movie;

  Data({this.movie});

  Data.fromJson(Map<String, dynamic> json) {
    movie = json['movie'] != null ? new Movie.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie.toJson();
    }
    return data;
  }
}

class Movie {
  int id;
  String name;
  String year;
  String director;
  String mainStar;
  String description;
  int favoritedByUsers;
  List<String> genres;
  String thumbnail;

  Movie(
      {this.id,
        this.name,
        this.year,
        this.director,
        this.mainStar,
        this.description,
        this.favoritedByUsers,
        this.genres,
        this.thumbnail});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    director = json['director'];
    mainStar = json['main_star'];
    description = json['description'];
    favoritedByUsers = json['favorited_by_users'];
    genres = json['genres'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['director'] = this.director;
    data['main_star'] = this.mainStar;
    data['description'] = this.description;
    data['favorited_by_users'] = this.favoritedByUsers;
    data['genres'] = this.genres;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
