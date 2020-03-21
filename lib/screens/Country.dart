import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text(country['name']),
            backgroundColor: Colors.pink,
          ),
        );
  }
}
