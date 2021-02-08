// import 'package:Carousel/Data/models/carousel.dart';
import 'package:Carousel/Data/models/carousel.dart';
import 'package:Carousel/Data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'Presentation/utilities/card_swap.dart';
// import 'Presentation/widget/list_bloc/list_bloc.dart';

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
        home: App());
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CarouselRepository carouselRepository;
  Future<List<Carousel>> futureCarousel;

  @override
  void initState() {
    super.initState();
    futureCarousel = callData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        // body: Text('data'),

        body: FutureBuilder<List<Carousel>>(
          future: futureCarousel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data
                  .toString() /*snapshot.data.first.toString() callData()*/);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        )

        // body: Container(
        //   child: callData(),
        // ),
        );
  }

  Future<List<Carousel>> callData() async {
    var a = await carouselRepository.getUserData(0.5.toString());
    return print(a) as List;
  }
}
