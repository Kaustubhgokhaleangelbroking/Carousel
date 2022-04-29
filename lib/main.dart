//import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import './presentation/apps/app.dart';
// import './presentation/widget/card_bloc/card_bloc.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return /*BlocProvider(
      create: (context) => CardBloc(),
      child: */
        MaterialApp(
      // title: 'BotToast Demo',
      // builder: BotToastInit(), //1. call BotToastInit
      // navigatorObservers: [
      // BotToastNavigatorObserver()
      // ], //2. registered route observer
      home: MyApps(),
    );

    // );
  }
}
// theme: ThemeData.dark().copyWith(
//   scaffoldBackgroundColor: Color(0xFF111111),
// ),

//
// import 'package:english_words/english_words.dart';
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Startup Name Generator',
//       theme: ThemeData(
//         primaryColor: Colors.amberAccent,
//       ),
//       home: RandomWords(),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsState();
// }

// class RandomWordsState extends State<RandomWords> {
//   final List<WordPair> _suggestions = <WordPair>[];
//   final Set<WordPair> _saved = Set<WordPair>();
//   final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Startup Name Generator'),
//         actions: <Widget>[
//           IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final Iterable<ListTile> tiles = _saved.map(
//             (WordPair pair) {
//               return ListTile(
//                 title: Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final List<Widget> divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Saved Suggestions'),
//             ),
//             body: ListView(children: divided),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: (BuildContext _context, int i) {
//           if (i.isOdd) {
//             return const Divider();
//           }
//           final int index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     final bool alreadySaved = _saved.contains(pair);
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }

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
