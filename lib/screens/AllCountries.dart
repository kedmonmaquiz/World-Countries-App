import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries;

  Future<List> getAllCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getAllCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
        appBar: AppBar(
          title: Text('All Countries'),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder<List>(
                future: countries,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot);
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 8.0),
                              child: Text(
                                snapshot.data[index]['name'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Country(snapshot.data[index]);
                            }));
                          });
                    });
                  }
                  return Text(
                    'Countries loading failed , Please Check your internet Connection....',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  );
                }),
          ),
        ));
  }
}
