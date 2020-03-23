import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CountryMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country map'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Center(
          child: Text('map service is temporary unavailable ...',style: TextStyle(color: Colors.green,fontSize: 20),),
        )
      ),
    );
  }
}
