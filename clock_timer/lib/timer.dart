//import 'dart:io';
import 'package:flutter/material.dart';

import 'dart:async';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: new EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$hoursStr:$minutesStr:$secondsStr",
            style: TextStyle(fontSize: 90),
          ),
          SizedBox(height: 30),
          ButtonsRecord(),
        ],
      ),
    );
  }
}

// class FlutterStopWatch extends StatefulWidget {
//   @override
//   _FlutterStopWatchState createState() => _FlutterStopWatchState();
// }

// class _FlutterStopWatchState extends State<FlutterStopWatch> {
//   bool flag = true;
//   Stream<int> timerStream;
//   String hoursStr = '00';
//   String minutesStr = '00';
//   String secondsStr = '00';

//   Stream<int> stopWatchStream() {
//     StreamController<int> streamController;
//     Timer timer;
//     Duration timerInterval = Duration(seconds: 1);
//     int counter = 0;

//     void stopTimer() {
//       if (timer != null) {
//         timer.cancel();
//         timer = null;
//         counter = 0;
//         streamController.close();
//       }
//     }

//     // this recive an timer but here use a counter
//     // prove if the timer is useful
//     void tick(_) {
//       counter++;
//       streamController.add(counter);

//       if (!flag) stopTimer();
//     }

//     void startTimer() {
//       timer = Timer.periodic(timerInterval, tick);
//     }

//     // It specific when the controll is closed
//     streamController = StreamController<int>(
//       onListen: startTimer,
//       onCancel: stopTimer,
//       onResume: startTimer,
//       onPause: stopTimer,
//     );

//     return streamController.stream;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: new EdgeInsets.all(16.0),
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "$hoursStr:$minutesStr:$secondsStr",
//             style: TextStyle(fontSize: 90),
//           ),
//           SizedBox(height: 30),
//           ButtonsRecord(
//             stopWatchStream,
//             hoursStr,
//             minutesStr,
//             secondsStr,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ButtonsRecord extends StatefulWidget {
  // Stream<int> Function() stopWatchStream;
  // String hoursStr = '00';
  // String minutesStr = '00';
  // String secondsStr = '00';

  // ButtonsRecord(
  //   this.stopWatchStream,
  //   this.hoursStr,
  //   this.minutesStr,
  //   this.secondsStr,
  // );

  @override
  _ButtonsRecordState createState() => _ButtonsRecordState();
}

class _ButtonsRecordState extends State<ButtonsRecord> {
  // ignore: cancel_subscriptions
  StreamSubscription<int> timerSubscription;
  Stream<int> Function() stopWatchStream;
  Stream<int> timerStream;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  void onPressedStarted() {
    timerStream = stopWatchStream();

    timerSubscription = timerStream.listen((newTick) {
      setState(() {
        hoursStr = ((newTick / (60 * 60)) % 60).toString().padLeft(2, '0');
        minutesStr = ((newTick / 60) % 60).toString().padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
      });
    });
  }

  void onPressedCancel() {
    timerSubscription.cancel();
    timerStream = null;
    setState(() {
      hoursStr = '00';
      minutesStr = '00';
      secondsStr = '00';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          child: Text("START", style: TextStyle(fontSize: 20)),
          onPressed: onPressedStarted,
        ),
        SizedBox(width: 40.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          child: Text("RESET", style: TextStyle(fontSize: 20)),
          onPressed: onPressedCancel,
        ),
      ],
    );
  }
}
