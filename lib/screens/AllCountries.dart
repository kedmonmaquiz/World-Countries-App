import 'package:flutter/material.dart';

import 'Country.dart';

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            child: Text('Click Me',style: TextStyle(fontSize: 18),),
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Country();
            }));
          }
          )
        ),
      ),
    );
  }
}
