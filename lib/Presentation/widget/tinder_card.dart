// import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) => //MaterialApp(
      // builder: BotToastInit(), //1. call BotToastInit
      // navigatorObservers: [BotToastNavigatorObserver()],
      //home:
      Container(
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
              navigationBar(),
            ],
          ),
        ),
        //  ),
      );

  CircleAvatar getProfileImage() => CircleAvatar(
        radius: 50.0,
        backgroundColor: Colors.blueGrey,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(48.0),
          child: Image.network(
            widget.user.picture.large,
            width: 96, //double to radius. to make circular border
            height: 96, //double to radius. to make circular border
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
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget navigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Color(0xFF6200EE),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.blueGrey.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
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
    );
  }

  Widget buttonIcon(IconData icon) => IconButton(
        onPressed: null,
        // onPressed: BotToast.showSimpleNotification(
        //   title: "Hi there !!",
        // ), // popup a notification toast;
        icon: Icon(
          icon,
          color: Colors.blueGrey,
          size: 35,
        ),
      );

  Divider get _divider => Divider(height: 28.0, color: Colors.transparent);
}
//bottom navigation bar
//button Bar
/*
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
//   // backgroundColor: Color(0xFF6200EE),
//   selectedItemColor: Colors.green,
//   unselectedItemColor: Colors.blueGrey.withOpacity(.60),
//   selectedFontSize: 14,
//   unselectedFontSize: 14,
//   items: [],
// ),
