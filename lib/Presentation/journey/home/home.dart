import 'package:Carousel/presentation/widget/card_bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_card/swipeable_card.dart';

// import '../../screens/favourite.dart';
import '../../entity/card.dart';
import '../../widget/list_bloc/list_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListBloc listBloc;
  CardBloc cardBloc;

  @override
  void initState() {
    super.initState();
    listBloc = ListBloc();
    cardBloc = CardBloc();
  }

  @override
  void dispose() {
    listBloc.close();
    cardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: pushSaved,
            ),
          ],
        ),
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
                      var lstate = state.carousel.results[0];
                      return Stack(
                        children: [
                          SwipeableWidget(
                            //      child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardExample(
                                  imageUUrl: lstate.picture.medium,
                                  name: '${lstate.name.title}.' +
                                      ' ' +
                                      '${lstate.name.first}' +
                                      ' ' +
                                      '${lstate.name.last}',
                                  address:
                                      // '${state.carousel.results[0].location.street.name},' +
                                      // '' +
                                      '${lstate.location.city},' +
                                          ' ' +
                                          '${lstate.location.state},' +
                                          ' ' +
                                          '${lstate.location.country}',
                                  phone: state.carousel.results[0].phone,
                                ),
                              ],
                            ),
                            onLeftSwipe: () => swipeLeft(),
                            onRightSwipe: () => swipeRight(lstate),
                            nextCards: [],
                          ),
                        ],
                      );
                      //       );
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  label: Text(
                    'Left Swipe',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    swipeLeft();
                  },
                ),
                FloatingActionButton.extended(
                  label: Text(
                    'Right Swipe',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 15,
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
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  void swipeLeft() {
    print("left");
    listBloc.add(ListFetchEvent());
  }

  void swipeRight(lState) {
    print("add to favourite");
    cardBloc.add(
      CardSwapEvent(swapE: lState),
    );
    // call card bloc to do set state and add it to favourite card dech
  }
}

pushSaved() {}
