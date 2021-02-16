import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/apps/app.dart';

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

// class App extends StatefulWidget {
//   App({Key key}) : super(key: key);

//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   // final carouselRepository = CarouselRepository(); //usecase r-d-u
//   Future<Carousel> futureCarousel;
//   UserUseCase userCase;
//   UserDataRemoteSource userDataRemoteSource;

//   @override
//   void initState() {
//     super.initState();
//     userDataRemoteSource = UserDataRemoteSource();
//     futureCarousel = callData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Test'),
//       ),
//       // body: Text('data'),

//       body: Center(
//         child: FutureBuilder<Carousel>(
//           future: futureCarousel,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text(
//                 snapshot.data.results[2].name.first,
//                 style: TextStyle(fontSize: 30),
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }

//   Future<Carousel> callData() async {
//     var a = await userDataRemoteSource.getUserData();
//     return (a);
//   }

//   /*
//     Future<Carousel> getUserData(/*{int count = 5}*/) async {
//       Map<String, dynamic> jsonData = await client.get('${ApiEndPoint.baseUrl}');
//       return Carousel.fromJson(jsonData);
//     }

//     Future<Carousel> callData() async {
//       var a = await carouselRepository.getUserData();
//       return (a);
//     }
//   }*/
//   /*
//   usecase to repo
//   repo to data source
//   data source to data client
//   use of usecase
//   */

// }
