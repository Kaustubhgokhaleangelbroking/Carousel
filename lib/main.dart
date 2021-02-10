import './presentation/utilities/card_swap.dart';

import './data/models/carousel.dart';
import './data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF111111),
        ),
        home: Home());
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final carouselRepository = CarouselRepository(); //usecase r-d-u
  Future<Carousel> futureCarousel;

  @override
  void initState() {
    super.initState();
    futureCarousel = carouselRepository.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        // body: Text('data'),

        body: FutureBuilder<Carousel>(
          future: futureCarousel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.results.length.toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Future<Carousel> callData() async {
    var a = await carouselRepository.getUserData();
    return (a);
  }
}
/*
usecase to repo 
repo to data source
data source to data client
use of usecase
*/
