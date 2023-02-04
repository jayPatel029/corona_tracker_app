import 'dart:convert';
import 'package:covid_19/data_source.dart';
import 'package:covid_19/pages/countryPage.dart';
import 'package:covid_19/panels/infoPanel.dart';
import 'package:covid_19/panels/mostaffectedcountries.dart';
import 'package:covid_19/panels/worldwidePanels.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map worldData;
  fetchWorldWideData() async {
    var uri = Uri.parse('https://disease.sh/v3/covid-19/all');
    http.Response response = await http.get(uri);
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  late List countryData;

  fetchCountryData() async {
    var uri = Uri.parse('https://disease.sh/v3/covid-19/countries?sort=cases');
    http.Response response = await http.get(uri);
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Covid-19 Tracker',
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.blue[100],
            child: Text(
              DataSource.quote,
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'WorldWide',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CountryPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          worldData == null
              ? CircularProgressIndicator()
              : WorldwidePanels(
                  worldData: worldData,
                ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Most Affected Countries',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          countryData == null
              ? Container()
              : MostAffectedPanel(
                  countryData: countryData,
                ),
          SizedBox(
            height: 30,
          ),
          InfoPanel(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'WE ARE TOGETHER IN THIS FIGHT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
