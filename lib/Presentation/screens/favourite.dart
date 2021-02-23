import 'package:Carousel/presentation/widget/card_bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  CardBloc cardBloc;

  @override
  void dispose() {
    cardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        cubit: cardBloc,
        builder: (context, state) {
          if (state is CardSwappingState) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (state is CardSwapState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.swapS.name.first),
                );
              },
            );
          }
          return Text(
            "Loading Favourites....",
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
