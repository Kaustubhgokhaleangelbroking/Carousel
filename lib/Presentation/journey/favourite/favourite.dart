import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favourite_bloc/favourite_screen_bloc.dart';
import '../../../presentation/widget/tinder_card.dart';
import '../../../presentation/widget/tinder_stack.dart';

class Favourite extends StatefulWidget {
  Favourite({Key key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  FavouriteScreenBloc _favoriteScreenBloc;

  @override
  void initState() {
    super.initState();
    _favoriteScreenBloc = FavouriteScreenBloc()..add(LoadUserEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteScreenBloc?.close();
  }

  @override
  SafeArea build(BuildContext context) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favourite'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocConsumer<FavouriteScreenBloc, FavouriteScreenState>(
                  bloc: _favoriteScreenBloc,
                  listener: onStateChange,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return _getLoader();
                    }
                    return (state?.carouselF?.results?.isNotEmpty ?? true)
                        ? _getStack(state)
                        : _getEmptyData();
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Container _getEmptyData() => Container(
        alignment: Alignment.center,
        child: Text(
          "No saved data!",
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      );

  Container _getLoader() => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  TinderStack _getStack(FavouriteScreenState state) => TinderStack(
        getCardList(state),
        onSwipeRight: onSwipeRight,
        onSwipeLeft: onSwipeLeft,
      );

  List<Widget> getCardList(FavouriteScreenState state) =>
      (state.carouselF?.results ?? []).map((user) => TinderCard(user)).toList();

  void onStateChange(BuildContext context, FavouriteScreenState state) {
    if (state is ItemRemovedState) {
      if (state.carouselF.results.isEmpty) {
        _favoriteScreenBloc.add(LoadUserEvent());
      }
    }
  }

  void onSwipeRight(int index) =>
      _favoriteScreenBloc.add(RemoveUserEvent(index: index, fromLocal: true));

  void onSwipeLeft(int index) =>
      _favoriteScreenBloc.add(RemoveUserEvent(index: index, fromLocal: false));
}

// import '../../../data/models/results.dart';
// import '../../widget/card_bloc/card_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Favourite extends StatefulWidget {
//   @override
//   _FavouriteState createState() => _FavouriteState();
// }

// class _FavouriteState extends State<Favourite> {
//   CardBloc cardBloc;
//   List<Results> listed;

//   @override
//   void initState() {
//     super.initState();
//     cardBloc = CardBloc();
//     //cardBloc = context.read<CardBloc>();
//     //load fav event
//     //load fav event usecase stored users load local data source talk databse load available users lib  local data source singleton sqflite screento journey
//   }

//   @override
//   void dispose() {
//     cardBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             BlocBuilder(
//               cubit: cardBloc,
//               builder: (context, state) {
//                 if (state is CardSwappingState) {
//                   return Container(
//                     alignment: Alignment.center,
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is CardSwapState) {
//                   return ListView.builder(
//                     //loaded state event trigger
//                     itemBuilder: (context, index) {
//                       // listed.add(state.swapS);
//                       return ListTile(
//                           // title: Text(state.swapS.name.first),
//                           );
//                     },
//                   );
//                 }
//                 return Text(
//                   "Loading Favourites....",
//                   textAlign: TextAlign.center,
//                 );
//               },
//             ),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => Navigator.pushNamed(context, "/"),
//                 child: Text("Go Back"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
