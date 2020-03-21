import 'package:flutter/material.dart';
void main(){
  runApp(AllCountries());
}

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'All Countries',
          home: Scaffold(
            appBar: AppBar(
              title: Text('All Countries'),
            ),
            body: Material(
              //Todo Materials
            ),
          ),
        );
  }
}
