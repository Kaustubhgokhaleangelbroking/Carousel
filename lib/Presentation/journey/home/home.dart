import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/widget/tinder_stack.dart';
import '../../../presentation/journey/home/list_bloc/list_bloc.dart';
import '../../../presentation/widget/tinder_card.dart';
import '../../../presentation/apps/routes_constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListBloc listBloc;

  @override
  void initState() {
    super.initState();
    listBloc = ListBloc()..add(ListFetchEvent());
  }

  @override
  void dispose() {
    listBloc.close();
    super.dispose();
  }

  @override
  SafeArea build(BuildContext context) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocConsumer<ListBloc, ListState>(
                  bloc: listBloc,
                  listener: onStateChange,
                  builder: (context, state) {
                    if (state is ListLoadingState) {
                      return _getLoader();
                    }
                    return _getTinderStack(state);
                  },
                ),
              ),
              _getFavoriteButton(),
            ],
          ),
        ),
      );

  Container _getLoader() => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  TinderStack _getTinderStack(ListState state) => TinderStack(
        getCardList(state),
        onSwipeRight: onSwipeRight,
        onSwipeLeft: onSwipeLeft,
      );

  Container _getFavoriteButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 108.0),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () =>
              Navigator.pushNamed(context, RouteConstants.favorite),
          child: Text(
            "Favorite",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
        ),
      );

  void onStateChange(BuildContext context, ListState state) {
    if (state is ItemRemovedState || state is UserSavedState) {
      if (state.carousel.results.isEmpty) {
        listBloc.add(ListFetchEvent());
      }
    }
  }

  List<Widget> getCardList(ListState state) => (state.carousel?.results ?? [])
      .map(
        (user) => TinderCard(user),
      )
      .toList();

  void onSwipeRight(int index) => listBloc.add(SaveUserEvent(index: index));

  void onSwipeLeft(int index) =>
      listBloc.add(RemoveUserItemEvent(index: index));
}
// child: TextButton.icon(
//   icon: Icon(
//     Icons.favorite_rounded,
//     color: Colors.red,
//   ),
//   label: Text('Foavourite'),
//   onPressed: () =>
//       Navigator.pushNamed(context, RouteConstants.favorite),
// ),
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_tindercard/flutter_tindercard.dart';
// // import 'package:swipeable_card/swipeable_card.dart';

// // import '../../../data/data%20source/user_local_data_source.dart';
// import '../../../presentation/journey/home/list_bloc/list_bloc.dart';
// import '../../../data/models/results.dart';
// import '../../entity/card_example.dart';
// import '../../widget/card_bloc/card_bloc.dart';
// import '../favourite/favourite.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> with TickerProviderStateMixin {
//   ListBloc listBloc;
//   CardBloc cardBloc;
//   CardController cardController;

//   @override
//   void initState() {
//     super.initState();
//     listBloc = ListBloc()..add(ListFetchEvent());
//     cardBloc = CardBloc();
//     cardController = CardController();
//   }

//   @override
//   void dispose() {
//     listBloc.close();
//     cardBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Home"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: blocBuilder(),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton.extended(
//                   label: Text(
//                     'Favourite',
//                     textAlign: TextAlign.center,
//                   ),
//                   onPressed: () {
//                     Favourite();
//                     Navigator.pushNamed(context, '/favourite');
//                   },
//                 ),
//               ],
//             ),
//             // add flat button to send and incremented count to data source through bloc which goest to result
//             SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget blocBuilder() {
//     return BlocBuilder(
//       cubit: listBloc,
//       builder: (context, state) {
//         if (state is ListLoadingState) {
//           return Container(
//             alignment: Alignment.center,
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is ListSuccess) {
//           List<Results> lstate = state.carousel.results;
//           return Container(
//             child: tinderSwipe(lstate),
//             // child: swipeWidget(lstate),
//             // child: futureBuild(lstate),
//           );
//         } else {
//           return Text(
//             "Home Page",
//             textAlign: TextAlign.center,
//           );
//         }
//       },
//     );
//   }

//   void swipeLeft(List<Results> lState) {
//     print("left");
//     print("${lState.length}");

//     //event to remove objet from list

//     if (lState.length == 0) {
//       listBloc.add(ListFetchEvent());
//     } else {}
//   }

//   void swipeRight(List<Results> lState) {
//     print("add to favourite");

//     cardBloc.add(
//       CardSwapEvent(swapE: lState),
//     );

//     listBloc.add(ListFetchEvent());
//     //context.read to access cardbloc
//     // call card bloc to do set state and add it to favourite card dech
//   }

//   Widget tinderSwipe(List<Results> lstate) {
//     return TinderSwapCard(
//       swipeUp: false,
//       swipeDown: false,
//       orientation: AmassOrientation.TOP,
//       totalNum: lstate.length,
//       stackNum: 3,
//       swipeEdge: 4.0,
//       maxWidth: MediaQuery.of(context).size.width * 0.9,
//       maxHeight: MediaQuery.of(context).size.width * 0.9,
//       minWidth: MediaQuery.of(context).size.width * 0.8,
//       minHeight: MediaQuery.of(context).size.width * 0.8,
//       allowVerticalMovement: false,
//       cardController: cardController = CardController(),
//       cardBuilder: (context, index) {
//         return Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               /*Center(
//                 child:*/
// CardExample(
//                 imageUUrl: lstate[index].picture.medium,
//                 name: '${lstate[index].name.title}.' +
//                     ' ' +
//                     '${lstate[index].name.first}' +
//                     ' ' +
//                     '${lstate[index].name.last}',
//                 address: '${lstate[index].location.city},' +
//                     ' ' +
//                     '${lstate[index].location.state},' +
//                     ' ' +
//                     '${lstate[index].location.country}',
//                 phone: lstate[index].phone,
//               ),
//               // ),
//             ],
//           ),
//         );
//       },
//       swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
//         if (align.x < 0) {
//           swipeLeft(lstate);
//         } else if (align.x > 0) {
//           swipeRight(lstate);

//           final snackBar = SnackBar(
//             content: Text(
//               'Yay! Card is added to favourite!',
//             ),
//             backgroundColor: Colors.green,
//             duration: Duration(milliseconds: 700),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       },
//       swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
//         print(orientation.toString());
//         if (orientation == CardSwipeOrientation.LEFT) {
//           print("Card is LEFT swiping");
//           print(lstate.length);
//         } else if (orientation == CardSwipeOrientation.RIGHT) {
//           print("Card is RIGHT swiping");
//           print(lstate.length);
//         }
//       },
//     );
//   }

//   Widget futureBuild(List<Results> lstate) {
//     return FutureBuilder(
//       future: null, //userLocalDataSource.fetchItems(lstate[index].id),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext context, int index) {
//               var item = snapshot.data[index];
//               return ListTile(
//                 title: Text(item.lastName),
//                 leading: Text(item.id.toString()),
//                 trailing: Checkbox(
//                   onChanged: (bool value) {
//                     //UserDataLocalSource.dataB.addItems(item);
//                     setState(() {});
//                   },
//                   value: item.blocked,
//                 ),
//               );
//             },
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//     // floatingActionButton:
//     // FloatingActionButton(
//     //   child: Icon(Icons.add),
//     //   onPressed: () async {
//     //     var rnd = testClients[math.Random().nextInt(testClients.length)];
//     //     await DBProvider.db.newClient(rnd);
//     //     setState(() {});
//     //   },
//     // );
//   }
// }

// '${state.carousel.results[0].location.street.name},' +
// '' +
// Widget swipeWidget(listState) {
//     return SwipeableWidget(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CardExample(
//             imageUUrl: listState.picture.medium,
//             name: '${listState.name.title}.' +
//                 ' ' +
//                 '${listState.name.first}' +
//                 ' ' +
//                 '${listState.name.last}',
//             address:
//                 // '${state.carousel.results[0].location.street.name},' +
//                 // '' +
//                 '${listState.location.city},' +
//                     ' ' +
//                     '${listState.location.state},' +
//                     ' ' +
//                     '${listState.location.country}',
//             phone: listState.phone,
//           ),
//         ],
//       ),
//       onLeftSwipe: () => swipeLeft(listState),
//       onRightSwipe: () {
//         swipeRight(listState);
//         final snackBar = SnackBar(
//           content: Text(
//             'Yay! Card is added to favourite!',
//           ),
//           backgroundColor: Colors.green,
//           duration: Duration(milliseconds: 700),
//         );

//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       },
//       nextCards: [],
//     );
//   }

// )
// return Stack(
// children: [ get list of cards from methods

// totalNum: 5,
// swipeUpdateCallback:
//     (DragUpdateDetails details, Alignment align) {
//   /// Get swiping card's alignment
//   if (align.x < 0) {
//     swipeLeft();
//     //Card is LEFT swiping
//   } else if (align.x > 0) {
//     swipeRight(lstate);
//     final snackBar = SnackBar(
//       content: Text(
//         'Yay! Card is added to favourite!',
//       ),
//       backgroundColor: Colors.green,
//       duration: Duration(milliseconds: 700),
//     );
//     Scaffold.of(context).showSnackBar(snackBar);
//   }
//   //Card is RIGHT swiping
// },
// swipeCompleteCallback:
//     (CardSwipeOrientation orientation, int index) {
//   /// Get orientation & index of swiped card!
// },
// ),
// ],
// );
//  ],
// );

//  TinderSwapCard(
//                             allowVerticalMovement: false,
//                             cardBuilder: (context, index) {
//                               return Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   CardExample(
//                                     imageUUrl: lstate.picture.medium,
//                                     name: '${lstate.name.title}.' +
//                                         ' ' +
//                                         '${lstate.name.first}' +
//                                         ' ' +
//                                         '${lstate.name.last}',
//                                     address:
//                                         // '${state.carousel.results[0].location.street.name},' +
//                                         // '' +
//                                         '${lstate.location.city},' +
//                                             ' ' +
//                                             '${lstate.location.state},' +
//                                             ' ' +
//                                             '${lstate.location.country}',
//                                     phone: lstate.phone,
//                                   ),
//                                 ],
//                               );
//                             },
//                             totalNum: 5,
//                             swipeUpdateCallback:
//                                 (DragUpdateDetails details, Alignment align) {
//                               /// Get swiping card's alignment
//                               if (align.x < 0) {
//                                 swipeLeft();
//                                 //Card is LEFT swiping
//                               } else if (align.x > 0) {
//                                 swipeRight(lstate);
//                                 final snackBar = SnackBar(
//                                   content: Text(
//                                     'Yay! Card is added to favourite!',
//                                   ),
//                                   backgroundColor: Colors.green,
//                                   duration: Duration(milliseconds: 700),
//                                 );
//                                 Scaffold.of(context).showSnackBar(snackBar);
//                               }
//                               //Card is RIGHT swiping
//                             },
//                             swipeCompleteCallback:
//                                 (CardSwipeOrientation orientation, int index) {
//                               /// Get orientation & index of swiped card!
//                             },
//                           ),

// totalNum: 5,
// swipeUpdateCallback:
//     (DragUpdateDetails details, Alignment align) {
//   /// Get swiping card's alignment
//   if (align.x < 0) {
//     swipeLeft();
//     //Card is LEFT swiping
//   } else if (align.x > 0) {
//     swipeRight(lstate);
//     final snackBar = SnackBar(
//       content: Text(
//         'Yay! Card is added to favourite!',
//       ),
//       backgroundColor: Colors.green,
//       duration: Duration(milliseconds: 700),
//     );
//     Scaffold.of(context).showSnackBar(snackBar);
//   }
//   //Card is RIGHT swiping
// },
// swipeCompleteCallback:
//     (CardSwipeOrientation orientation, int index) {
//   /// Get orientation & index of swiped card!
// },
// ),

//       // allowVerticalMovement: false,
//       // cardBuilder: (context, index) {
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CardExample(
//             imageUUrl: lstate.picture.medium,
//             name: '${lstate.name.title}.' +
//                 ' ' +
//                 '${lstate.name.first}' +
//                 ' ' +
//                 '${lstate.name.last}',
//             address:
//                 // '${state.carousel.results[0].location.street.name},' +
//                 // '' +
//                 '${lstate.location.city},' +
//                     ' ' +
//                     '${lstate.location.state},' +
//                     ' ' +
//                     '${lstate.location.country}',
//             phone: lstate.phone,
//           ),
//         ],
//       ),
//       onLeftSwipe: () => swipeLeft(),
//       onRightSwipe: () {
//         swipeRight(lstate);
//         final snackBar = SnackBar(
//           content: Text(
//             'Yay! Card is added to favourite!',
//           ),
//           backgroundColor: Colors.green,
//           duration: Duration(milliseconds: 700),
//         );
//         Scaffold.of(context).showSnackBar(snackBar);
//       }),
// (
//      child: SingleChildScrollView(

//   actions: <Widget>[
//     IconButton(
//       icon: const Icon(Icons.list),
//       onPressed: pushSaved(),
//     ),
//   ],

// onLeftSwipe:
// () => swipeLeft();
// onRightSwipe:
// () {
//   swipeRight(lstate);
//   final snackBar = SnackBar(
//     content: Text(
//       'Yay! Card is added to favourite!',
//     ),
//     backgroundColor: Colors.green,
//     duration: Duration(milliseconds: 700),
//   );
//   Scaffold.of(context).showSnackBar(snackBar);
// };

// FloatingActionButton.extended(
//   label: Text(
//     'Left Swipe',
//     textAlign: TextAlign.center,
//   ),
//   onPressed: () {
//     swipeLeft();
//   },
// ),
// Container(
//   margin: EdgeInsets.only(top: 10, bottom: 5),
//  //  top: 10, left: 10, right: 10
//   padding: EdgeInsets.only(top: 10, left: 10, right: 10),
//   //top: 10, bottom: 5
//   child: FloatingActionButton.extended(
//     label: Text(
//       'Favourite',
//       textAlign: TextAlign.center,
//     ),
//     onPressed: () {
//       Navigator.pushNamed(context, '/favourite');
//       Favourite();
//     },
//   ),
// ),

// FloatingActionButton.extended(
//   label: Text(
//     'Right Swipe',
//     textAlign: TextAlign.center,
//   ),
//   onPressed: () {
//     swipeRight();
//   },
// )
// ],
// ),
// SizedBox(
//   height: 15,
// ),
// FlatButton(
//   onPressed: () {
//     listBloc.add(ListFetchEvent());
//   },
//   child: Text(
//     "Tap to Load",
//     textAlign: TextAlign.center,
//   ),
// ),

// SizedBox(
//   height: 40,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     FloatingActionButton.extended(
//       label: Text(
//         'Left Swipe',
//         textAlign: TextAlign.center,
//       ),
//       onPressed: () {
//         swipeLeft();
//       },
//     ),
//     FloatingActionButton.extended(
//       label: Text(
//         'Right Swipe',
//         textAlign: TextAlign.center,
//       ),
//       onPressed: () {
//         swipeRight(lstate);
//       },
//     )
//   ],
// ),

// AppBar _appBar() {
//   return AppBar(
//     centerTitle: true,
//     automaticallyImplyLeading: false,
//     title: Text(
//       "Home",
//       style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w600)
//   ),);
// }

// CardExample(

//   imageUUrl: state.carousel.results[0].picture.medium,
//   name: '${state.carousel.results[0].name.title}.' +
//       ' ' +
//       '${state.carousel.results[0].name.first}' +
//       ' ' +
//       '${state.carousel.results[0].name.last}',
//   address: '${state.carousel.results[0].location.street.name},' +
//       ' ' +
//       '${state.carousel.results[0].location.city},' +
//       ' ' +
//       '${state.carousel.results[0].location.state},' +
//       ' ' +
//       '${state.carousel.results[0].location.country}',
//   phone: state.carousel.results[0].phone,
// ),
// Text(
//   state.carousel.results[0].name.first,
// ),

/*

  ListView(
      children: [
        Text(
          state.carousel.results[4].name.first,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        )
      ],
    );

  */

// if (currentCardIndex < cards.length)
//   SwipeableWidget(
//     key: ObjectKey(currentCardIndex),
//     child: cards[currentCardIndex],
//     onLeftSwipe: () => swipeLeft(),
//     onRightSwipe: () => swipeRight(),
//     nextCards: <Widget>[
//       if (!(currentCardIndex + 1 >= cards.length))
//         Align(
//           alignment: Alignment.center,
//           child: cards[currentCardIndex + 1],
//         ),
//     ],
//   )
// else
//   Center(
//     child: FlatButton(
//       child: Text("Reset deck"),
//       onPressed: () => setState(() => currentCardIndex = 0),
//     ),
//   ),

// if (currentCardIndex < cards.length)
//   cardControllerRow(_cardController),

//     );

// void swipeLeft(var a) {
//   print("left");
//   Text(a);

//   setState(() => currentCardIndex++);
// }

// void swipeRight(var a) {
//   print("right");
//   Text(a);
//   setState(() => currentCardIndex++);
// }

// void swipeTop() {
//   print("top");
//   setState(() => currentCardIndex++);
// }

// void swipeBottom() {
//   print("top");
//   setState(() => currentCardIndex++);
// }

// Widget cardControllerRow(SwipeableWidgetController cardController) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: <Widget>[
//       FlatButton(
//         child: Text("Left"),
//         onPressed: () => cardController.triggerSwipeLeft(),
//       ),
//       FlatButton(
//         child: Text("Right"),
//         onPressed: () => cardController.triggerSwipeRight(),
//       ),
//     ],
//   );
// }

/*
  ListView(
  children: [
  Text(
  state.carousel.results[2].name.first,
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 30),
  )
  ],
  );
  ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: 1,
  itemBuilder: (BuildContext context, int index) {
  return Text(
  state.carousel.results[2].location.postcode.toString(),
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 30),
  );
  },
  );
  Text(
  state.carousel.results[2].name.first,
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 30),

  user journey
  screen group of modules
  eg home functionality goes in home
  );*/

// CardArrangement(
//     imageuUrl:
//         state.carousel.results[0].picture.medium),
// SizedBox(
//   height: 10,
// ),
// Text(state.carousel.results[0].picture.medium),
// SizedBox(
//   height: 10,
// ),
// Text('${state.carousel.results[0].name.title}.' +
//     ' ' +
//     '${state.carousel.results[0].name.first}' +
//     ' ' +
//     '${state.carousel.results[0].name.last}'),
// SizedBox(
//   height: 10,
// ),
// Text('${state.carousel.results[0].location.street.name},' +
//     ' ' +
//     '${state.carousel.results[0].location.city},' +
//     ' ' +
//     '${state.carousel.results[0].location.state},' +
//     ' ' +
//     '${state.carousel.results[0].location.country}'),
// SizedBox(
//   height: 10,
// ),
// Text(
//   state.carousel.results[0].phone,
// ),
