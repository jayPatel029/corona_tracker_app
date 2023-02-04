
import 'package:covid_19/data_source.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/homepage.dart';
import 'package:covid_19/theme.dart';

void main()
{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
    }
  }
