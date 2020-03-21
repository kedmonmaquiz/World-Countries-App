import 'package:flutter/material.dart';
import 'screens/AllCountries.dart';

void main(){
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'All Countries',
          home: AllCountries(),
      )
  );
}
