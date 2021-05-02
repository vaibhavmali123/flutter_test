
import 'package:flutter/material.dart';
import 'package:flutter_test_application/blocs/MoviesDetailsBloc.dart';
import 'package:flutter_test_application/models/DetailsModel.dart';

class MovieDetails extends StatefulWidget
{
  final id;

  MovieDetails({this.id});

  MovieDetailsState createState(){
    return MovieDetailsState(id);
  }
}

class MovieDetailsState extends State<MovieDetails>
{
  final id;

  MovieDetailsState(this.id);
MoviesDetailsBloc moviesDetailsBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  print("ID ${id}");
  moviesDetailsBloc=MoviesDetailsBloc(id:id);
  moviesDetailsBloc.fetchMovieDetails();
  }
  @override
  Widget build(BuildContext context)
  {
  return Scaffold(
    appBar:AppBar(
      title:Text('Movies Details'),
      backgroundColor:Colors.black87.withOpacity(0.7),
    ),
    body:
    SafeArea(child:
    Container(
      color:Colors.black54,
      child:StreamBuilder(
        stream:moviesDetailsBloc.moviesDetailsStream,
        builder:(context,snapshot){
          if (snapshot.hasData) {
            DetailsModel detailsModel=DetailsModel();
            detailsModel=snapshot.data;
            return
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/3,
                    child:Image.network(detailsModel.data.movie.thumbnail,fit:BoxFit.contain,),

                  ),
                  Padding(padding:EdgeInsets.all(12),
                  child:Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Image.network(detailsModel.data.movie.thumbnail,fit:BoxFit.contain,),
                      Padding(padding:EdgeInsets.only(left:10),
                      child:Column(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text('Name: '+detailsModel.data.movie.name,style:TextStyle(fontSize:15,
                              color:Colors.white),),
                          Text('Year: '+detailsModel.data.movie.year,style:TextStyle(fontSize:15,
                              color:Colors.white),),
                          Text('Director: '+detailsModel.data.movie.director,
                            style:TextStyle(fontSize:15,
                              color:Colors.white),),
                          Text('Main Star: '+detailsModel.data.movie.mainStar
                            ,style:TextStyle(fontSize:15,
                              color:Colors.white),),

                          Container(
                            width:MediaQuery.of(context).size.width/1.5,
                            //fit:FlexFit.tight,
                            child:Text('Genres: '+detailsModel.data.movie.genres.toString(),softWrap:true,maxLines:2,
                            style:TextStyle(fontSize:14,
                                color:Colors.white),),
                          )
                        ],
                      ),
                      )
                    ],
                  ),
                  ),

                  Padding(padding:EdgeInsets.only(left:10,top:4),
                  child:Text('Description: '+detailsModel.data.movie.description,
                    style:TextStyle(fontSize:15,height:1,
                        color:Colors.white),)
                    )
                ],
              );
          }
          if (snapshot.hasError) {
            return Container(
              child:Center(
                child:Text(snapshot.error),
              ),
            );
          }
          else{
            return Container(
              child:Center(
                child:CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    ))
  );
  }
}