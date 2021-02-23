import 'package:flutter/material.dart';

import './card_arrangement.dart';

class CardExample extends StatelessWidget {
  final imageUUrl;
  final name;
  final address;
  final phone;
  const CardExample({this.imageUUrl, this.name, this.address, this.phone});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: //Scaffold(
          // appBar: AppBar(
          //   title: Text('Card Swap'),
          // ),
          // body:
          Center(
        // child: Expanded(
        child: Card(
          elevation: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              CardArrangement(
                imageuUrl: imageUUrl,
              ),
              SizedBox(
                height: 20,
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
                  color: Colors.grey[700],
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
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: 35,
                    ),
                    hoverColor: Colors.green,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 35,
                    ),
                    hoverColor: Colors.green,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 35,
                    ),
                    hoverColor: Colors.green,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 35,
                    ),
                    hoverColor: Colors.green,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    hoverColor: Colors.green,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
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
      //             color: Colors.grey,
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
      //               color: Colors.grey,
      //             ),
      //             Icon(
      //               Icons.calendar_today_rounded,
      //               color: Colors.grey,
      //               size: 25,
      //             ),
      //             Icon(
      //               Icons.location_on,
      //               color: Colors.grey,
      //               size: 25,
      //             ),
      //             Icon(
      //               Icons.phone,
      //               color: Colors.grey,
      //               size: 25,
      //             ),
      //             Icon(
      //               Icons.lock,
      //               color: Colors.grey,
      //               size: 25,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      //   ),
    );
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
