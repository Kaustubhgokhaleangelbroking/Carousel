// import 'package:bot_toast/bot_toast.dart';
import 'package:_carousel/presentation/widget/bloc/button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:path/path.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:speech_bubble/speech_bubble.dart';

import '../../data/models/results.dart';

class TinderCard extends StatefulWidget {
  final Results user;

  TinderCard(this.user);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  ButtonBloc buttonBloc;

  @override
  void initState() {
    super.initState();
    buttonBloc = ButtonBloc();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _divider,
              getProfileImage(),
              _divider,
              getName(),
              _divider,
              getAddress(),
              _divider,
              BlocBuilder<ButtonBloc, ButtonState>(
                bloc: buttonBloc,
                builder: (context, state) {
                  if (state is ButtonDataState) {
                    return Text('${state.text}');
                  }
                  if (state is ButtonDataLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text('Call an event !!!');
                },
              ),
              navigationBar(widget.user),
            ],
          ),
        ),
        // ),
      );

  CircleAvatar getProfileImage() => CircleAvatar(
        radius: 50.0,
        backgroundColor: Colors.blueGrey[900],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0), //48
          child: Image.network(
            widget.user.picture.large,
            width: 98.5, //double to radius. to make circular border 96
            height: 98.5, //double to radius. to make circular border 96
          ),
        ),
      );

  Widget getName() => Text(
        '${widget.user.name.title}.' +
            ' ' +
            '${widget.user.name.first}' +
            ' ' +
            '${widget.user.name.last}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
  // }

  Widget getAddress() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My Address is',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey[700],
            ),
            textAlign: TextAlign.center,
          ),
          _divider,
          Text(
            '${widget.user.location.city}' +
                ', ' +
                '${widget.user.location.state}' +
                ', ' +
                '${widget.user.location.country}.',
            style: TextStyle(
              fontSize: 22.5,
              color: Colors.black,

              // fontWeight: FontWeight.bold,
            ),
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget navigationBar(Results user) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      backgroundColor: Colors.white10,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.blueGrey.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: [
        BottomNavigationBarItem(
          label: 'Information',
          icon: Icon(Icons.info),
        ),
        BottomNavigationBarItem(
          label: 'Location',
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          label: 'Phone',
          icon: Icon(Icons.phone),
        ),
        BottomNavigationBarItem(
          label: 'Calendar',
          icon: Icon(Icons.calendar_today),
        ),
      ],
      onTap: (value) {
        // setState(() {
        //   BotToast.showText(text: value.toString());
        // });
        buttonBloc.add(
          ButtonTapEvent(icons: value, user: user),
        );
      },
    );
  }

  Divider get _divider => Divider(height: 28.0, color: Colors.transparent);

  // Widget buttonIcon(IconData icon) => IconButton(
  //       onPressed: null,
  //       // onPressed: BotToast.showSimpleNotification(
  //       //   title: "Hi there !!",
  //       // ), // popup a notification toast;
  //       icon: Icon(
  //         icon,
  //         color: Colors.blueGrey,
  //         size: 35,
  //       ),
  //     );

}
//bottom navigation bar
//button Bar
/*

Name folder in small caps
Class name = foldername
Use package import at all times
always organise your imports
Remove comments or add todo might require later
Todo with username
Free number / free text (models coordinates, id etc)  -> common folder created json key constants 
Entity -> domain
Crater new folder tinder card move dart file in folder ,crate constant dart file which is an abstract class which contains hardcode number 
Font size 1

Dart
Package
Flutter 
Imports 

Screen util package

Navigation bloc


Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: buttonBloc.add(ButtonTapEvent()),
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: null,
                  ),
                ],
              ),
buttonIcon(Icons.info),
                  buttonIcon(Icons.location_on),
                  buttonIcon(Icons.phone),
                  buttonIcon(Icons.calendar_today_rounded),

if (state is ButtonDataLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else 
  onPress(context) {
    GestureDetector(
      onTap: () {
        print('Woking');
        setState(() {
          Center(
            child: SpeechBubble(
              nipLocation: NipLocation.TOP,
              child: Text(
                'Single',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          );

          // final snackBar = SnackBar(content: Text("Tap"));

          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      // The custom button
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  } */
// ButtonBar(
//   alignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     buttonIcon(Icons.info),
//     buttonIcon(Icons.location_on),
//     buttonIcon(Icons.phone),
//     buttonIcon(Icons.calendar_today_rounded),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     buttonIcon(Icons.info),
//     buttonIcon(Icons.location_on),
//     buttonIcon(Icons.phone),
//     buttonIcon(Icons.calendar_today_rounded),
//   ],
//   // );
//   //      },
// ),
//
/*    BlocBuilder(
                  bloc: _buttonBloc,
                  builder: (context, state) {
                    return */
// BottomNavigationBar(items: items),
// BottomNavigationBar(
//   type: BottomNavigationBarType.fixed,
//   selectedItemColor: Colors.green,
//   unselectedItemColor: Colors.blueGrey.withOpacity(.60),
//   selectedFontSize: 14,
//   unselectedFontSize: 14,
//   items: [],
// ),
