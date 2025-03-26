import 'package:flutter/material.dart';
import 'package:movies_app/data2/model/genre_response/Genres.dart';

// import '../../../../../api2/api_manager.dart';

class MovieGenreView extends StatefulWidget{
  final List<Genres> genres;
  const MovieGenreView(this.genres,{super.key});

  @override
  State<MovieGenreView> createState() => _MovieGenreViewState();
}
var currentIndex = 0;

class _MovieGenreViewState extends State<MovieGenreView> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: widget.genres.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: buildTabs(widget.genres),
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          // Expanded(
          //     child: FutureBuilder(
          //       future: ApiManager.getInstance().getMovies(widget.genres[currentIndex].id ),
          //       builder: (context,snapshot) {
          //         if(snapshot.connectionState == ConnectionState.waiting){
          //           return Center(child: CircularProgressIndicator(color: Theme.of(context).indicatorColor),);
          //         }else if(snapshot.hasError){
          //           return Center(child: Text(snapshot.error.toString()),);
          //         }
          //         var newsList = snapshot.data?.results ?? [];
          //         return NewsListView(articles: newsList);
          //       },
          //     )
          // )
          // TabBarView(
          //   controller: _tabController,
          //   children:
          //   dummySources.map((source) {
          //     return Center(child: NewsListView(articles: dummyNews,));
          //   }).toList(),
          // ),
          //

        ],
      ),
    );
  }
  List<Tab> buildTabs(List<Genres> genres) {
    return genres
        .map((genre) =>
        Tab(
          child: Text(
            genre.name ?? "",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ))
        .toList();
  }
  @override
  void dispose(){
    super.dispose();
    //_tabController.dispose();
  }
}