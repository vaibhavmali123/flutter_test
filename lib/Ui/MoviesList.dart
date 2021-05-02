
import 'package:flutter/material.dart';
import 'package:flutter_test_application/Ui/MovieDetails.dart';
import 'package:flutter_test_application/blocs/MoviesBloc.dart';
import 'package:flutter_test_application/models/ItemModel.dart';
import 'package:flutter_test_application/networking/ApiHandler.dart';
import 'package:flutter_test_application/networking/Repository.dart';
import 'package:flutter_test_application/blocs/MoviesBloc.dart';
class MoviesList extends StatefulWidget
{

  MoviesListState createState(){
    return MoviesListState();
  }
}

class MoviesListState extends State<MoviesList>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc.fetchMovies();
  }
dynamic size;
  @override
  Widget build(BuildContext context)
  {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        title:Text('Movies App'),
        backgroundColor:Colors.black87.withOpacity(0.7),
      ),
      body:StreamBuilder(
        stream:moviesBloc.allMoviesStream,
          builder:(context,snapshot){
          if (snapshot.hasData) {
            return displayGrid(snapshot);
          }
          else if (snapshot.hasError) {
            return Center(
              child:Text(snapshot.error),
            );
          }
          else{
            print("RES d${snapshot.data}");
            return Center(
              child:CircularProgressIndicator(),
            );
          }
          },
      ),
    );
  }

  Widget displayGrid(AsyncSnapshot<ItemModel> snapshot) {
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return
      Padding(padding:EdgeInsets.all(8),
      child:GridView.count(
        crossAxisCount:2,
        mainAxisSpacing:5,
        crossAxisSpacing:10,
        childAspectRatio:MediaQuery.of(context).size.height /1250,
        children:List.generate(snapshot.data.data.movies.length, (index){

          return GestureDetector(
            onTap:()=>navigateToMovieDetails(snapshot.data,index),
            child:Container(
              color:Colors.black54,
                child:
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/3.6,
                      width:MediaQuery.of(context).size.width/2,
                      child:snapshot.data.data.movies[index].thumbnail!=null?
                      Image.network(snapshot.data.data.movies[index].thumbnail,
                        fit:BoxFit.contain,scale:0.4,
                      //  fit:BoxFit.contain,
                      ):
                      Container(color:Colors.grey,),
                    ),
                    SizedBox(height:4,),
                    Text(' Name: '+snapshot.data.data.movies[index].name,style:TextStyle(fontSize:14,
                    color:Colors.white),),
                    Text(' Year: '+snapshot.data.data.movies[index].year,style:TextStyle(fontSize:14,
                        color:Colors.white),)

                  ],
                )
              /*Image.network(itemModel.data.movies[index].thumbnail,fit:BoxFit.cover,),*/
            ),
          );
        }),
      ),
      );
  }

  navigateToMovieDetails(ItemModel itemModel,int index) {
  
    Navigator.push(context,MaterialPageRoute(builder:(context){

      return MovieDetails(
        id:itemModel.data.movies[index].id,
      );
    }));
  }
}