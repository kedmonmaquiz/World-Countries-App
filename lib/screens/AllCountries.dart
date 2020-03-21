import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  var countries;
  void getAllCountries() async{
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    countries = response.data;
    print(countries.length);
  }

  @override
  Widget build(BuildContext context) {
    getAllCountries();
    print(countries);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Countries'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
          child:  Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            'Brazil',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (BuildContext) {
                          return Country('Brazil');
                        }));
                      }),

                  GestureDetector(
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            'Canada',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (BuildContext) {
                          return Country('canada');
                        }));
                      })
                ],
              )),
      ),
    );
  }
}
