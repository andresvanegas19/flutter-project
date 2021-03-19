import 'package:flutter/material.dart';
import './widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          color: Color(0xFFF6F6F6F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
              TaskCard(),
            ],
          ),
        ),
      ),
    );
  }
}
