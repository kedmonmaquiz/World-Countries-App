import 'package:flutter_svg/svg.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'CountryMap.dart';

class Country extends StatelessWidget {
  final Map country;

  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Capital'),
              back: CountryDetailCard(title: country['capital'],color: Colors.deepPurple,),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Population'),
              back: CountryDetailCard(title: country['population'].toString(),color: Colors.teal,),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Flag'),
              back: Card(
                child: Center(
                  child: SvgPicture.network(country['flag']),
                ),
              ),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: 'Currency'),
              back: CountryDetailCard(title: country['currencies'][0]['name'],color: Colors.lightBlueAccent),
            ),
            GestureDetector(
              child: CountryCard(title: 'Show on Map'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return CountryMap();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String title;
  final Color color;

  const CountryDetailCard({
    Key key,this.title,this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
        ),
      ),
      color: color,
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
