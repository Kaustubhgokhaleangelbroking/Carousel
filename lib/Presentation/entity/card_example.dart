import 'package:flutter/material.dart';
import 'package:speech_bubble/speech_bubble.dart';

import 'card_arrangement.dart';

class CardExample extends StatelessWidget {
  final imageUUrl;
  final name;
  final address;
  final phone;
  const CardExample({this.imageUUrl, this.name, this.address, this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          CardArrangement(
            imageuUrl: imageUUrl,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'My Address is',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey[700],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            address,
            style: TextStyle(
              fontSize: 22.5,
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Phone: $phone',
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40, //
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.blueGrey,
                  size: 35,
                ),
                onPressed: () {
                  Center(
                    child: SpeechBubble(
                      nipLocation: NipLocation.TOP,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.blueGrey,
                  size: 35,
                ),
                onPressed: () {
                  SpeechBubble(
                    nipLocation: NipLocation.TOP,
                    child: Text(
                      address,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.blueGrey,
                  size: 35,
                ),
                onPressed: () {
                  Center(
                    child: SpeechBubble(
                      nipLocation: NipLocation.TOP,
                      child: Text(
                        phone,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.lock,
                  color: Colors.blueGrey,
                  size: 35,
                ),
                onPressed: () {
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
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.blueGrey,
                  size: 35,
                ),
                onPressed: () {
                  Center(
                    child: SpeechBubble(
                      nipLocation: NipLocation.TOP,
                      child: Text(
                        "Date",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );

    // ),
    // body: Container(
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //   height: double.infinity,
    //   width: double.infinity,
    //   padding: EdgeInsets.all(38.0),
    //   decoration: _boxDecoration(),
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         CardArrangement(),
    //         SizedBox(
    //            height: 25,
    //          ),
    //         Text(
    //           'Name',
    //           style: TextStyle(
    //             color: Colors.black87,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 25,
    //           ),
    //         ),
    //         Text(
    //           'My Address is',
    //           style: TextStyle(
    //             fontSize: 25.0,
    //             color: Colors.blueGrey,
    //           ),
    //         ),
    //         Text(
    //           'abc 123 mand',
    //           style: TextStyle(
    //             fontSize: 20.0,
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Icon(
    //               Icons.info,
    //               color: Colors.blueGrey,
    //             ),
    //             Icon(
    //               Icons.calendar_today_rounded,
    //               color: Colors.blueGrey,
    //               size: 25,
    //             ),
    //             Icon(
    //               Icons.location_on,
    //               color: Colors.blueGrey,
    //               size: 25,
    //             ),
    //             Icon(
    //               Icons.phone,
    //               color: Colors.blueGrey,
    //               size: 25,
    //             ),
    //             Icon(
    //               Icons.lock,
    //               color: Colors.blueGrey,
    //               size: 25,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //   ),
  }

  // BoxDecoration _boxDecoration() {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(15.0),
  //     border: Border.all(
  //       width: 2.0,
  //       color: Colors.transparent.withOpacity(0.3),
  //     ),
  //   );
  // }
}
