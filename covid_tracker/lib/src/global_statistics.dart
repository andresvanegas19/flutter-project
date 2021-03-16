import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/global_summary.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;

  GlobalStatistics(this.summary);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    List childrens = <Widget>[
      buildCard(
        "CONFIRMED",
        summary.totalConfirmed,
        summary.newConfirmed,
        kConfirmedColor,
        _screenSize,
      ),
      buildCard(
        "ACTIVE",
        summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
        summary.newConfirmed - summary.newRecovered - summary.newDeaths,
        kActiveColor,
        _screenSize,
      ),
      buildCard(
        "RECOVERED",
        summary.totalRecovered,
        summary.newRecovered,
        kRecoveredColor,
        _screenSize,
      ),
      buildCard(
        "DEATH",
        summary.totalDeaths,
        summary.newDeaths,
        kDeathColor,
        _screenSize,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "statics update " + timeago.format(summary.date),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView(
            children: childrens,
          ),
        ),
      ],
    );
  }

  Widget buildCard(
      String title, int totalCount, int todayCount, Color color, Size size) {
    Widget cart = Container(
      height: size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    totalCount.toString().replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Today",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    todayCount.toString().replaceAllMapped(reg, mathFunc),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return Card(
      elevation: 10,
      child: cart,
    );
  }
}
