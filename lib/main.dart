//import 'dart:io';
//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'dosya_islemleri.dart';
import 'gelismis_hesap_makinesi.dart';
import 'hesap_makinesi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HesapMakinesi(),
    );
  }
}
