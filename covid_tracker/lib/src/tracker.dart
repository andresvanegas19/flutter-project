import 'package:flutter/material.dart';
import '../utils/constants.dart';
import './navigation_option.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("COVID-19 Tracker Live Data"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              // child: AnimatedSwitcher(
              //   duration: Duration(milliseconds: 250),
              //   child: navigationStatus == Nav
              // ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                  title: "Global",
                  selected: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: () => setState(() {
                    navigationStatus = NavigationStatus.GLOBAL;
                  }),
                ),
                NavigationOption(
                  title: "Country",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () => setState(() {
                    navigationStatus = NavigationStatus.COUNTRY;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         First(),
//       ],
//     );
//   }
// }

// class First extends StatelessWidget {
//   NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.all(32),
//         decoration: BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(50),
//             bottomLeft: Radius.circular(50),
//           ),
//         ),
//         // child: AnimatedSwitcher(
//         //   duration: Duration(milliseconds: 250),
//         //   child: navigationStatus == Nav
//         // ),
//       ),
//     );
//   }
// }
