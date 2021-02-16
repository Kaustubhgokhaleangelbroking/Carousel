import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:swipeable_card/swipeable_card.dart';
import '../../widget/list_bloc/list_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListBloc listBloc;

  @override
  void initState() {
    super.initState();
    listBloc = ListBloc();
  }

  @override
  void dispose() {
    listBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder(
                  cubit: listBloc,
                  builder: (context, state) {
                    if (state is ListLoadingState) {
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ListSuccess) {
                      return ListView(
                        children: [
                          Text(
                            state.carousel.results[4].name.first,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      );
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
                            state.carousel.results[2].location.postcode
                                .toString(),
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
                    } else {
                      return Text(
                        "Home Page",
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                listBloc.add(ListFetchEvent());
              },
              child: Text(
                "Tap to Load",
                textAlign: TextAlign.center,
              ),
            ),

            // add flat button to send and incremented count to data source through bloc which goest to result
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        "Home",
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

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
