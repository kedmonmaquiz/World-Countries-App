import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Country.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List countries=[];
  bool isPressed = false;

  getAllCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  void filterCountries(String value) {
    print(value);
  }

  @override
  void initState() {
    getAllCountries().then((data) {
        setState(() {
          countries = data;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !isPressed
              ? Text('All Countries')
              : TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search a Country here',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {
                    filterCountries(value);
                  },
                ),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            !isPressed ? IconButton(
                    icon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            this.isPressed = !this.isPressed;
                          });
                        }),
                  )
                : IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isPressed = !this.isPressed;
                      });
                    }),
          ],
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: countries.length > 0 ? ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 8.0),
                            child: Text(
                              countries[index]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Country(countries[index]);
                          }));
                        });
                  }) :
                  Center(child: CircularProgressIndicator(),)
          ),
        ));
  }
}
