import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GlobalLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = MediaQuery.of(context).size.height * 0.2;
    return Column(
      children: [
        loadingCard(_size),
        loadingCard(_size),
        loadingText(),
      ],
    );
  }

  Widget loadingCard(double size) {
    return Card(
      elevation: 20,
      child: Container(
        height: size,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(width: 50, height: 20, color: Colors.white),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                height: 15,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.blue[600],
        highlightColor: Colors.blue[600],
        child: Column(
          children: [
            Container(
              width: 200,
              height: 16,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
