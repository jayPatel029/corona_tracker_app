import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);
  @override
  State<CountryPage> createState() => _CountryPageState();
}

// class _CountryPageState extends State<CountryPage> {
//   late List countryData;
//
//   fetchCountryData() async {
//     var uri = Uri.parse('https://disease.sh/v3/covid-19/countries');
//     http.Response response = await http.get(uri);
//     setState(() {
//       countryData = jsonDecode(response.body);
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchCountryData();
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Country Stats'),
//       ),
//       body: countryData == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 130,
//                   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   decoration: const BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 10,
//                         offset: Offset(0, 10)),
//                   ]),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(10.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               countryData[index]['Country'],
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Image.network(
//                               countryData[index]['countryInfo']['flag'],
//                               height: 40,
//                               width: 50,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(child: Column(
//                         children: <Widget>[
//                           Text('Confirmed' + countryData[index]['cases']),
//                           Text('Active${countryData[index]['active']}'),
//                           Text('Recovered${countryData[index]['recovered']}'),
//                           Text('Deaths${countryData[index]['deaths']}'),
//                         ],
//                       ))
//                     ],
//                   ),
//                 );
//               },
//               itemCount: countryData == null ? 0 : countryData.length,
//             ),
//     );
//   }
// }


class _CountryPageState extends State<CountryPage> {
  late List countryData;

  fetchCountryData() async {
    var uri = Uri.parse('https://disease.sh/v3/covid-19/countries');
    http.Response response = await http.get(uri);
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Stats'),
      ),
      body: countryData==null? Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount: countryData.length,
          itemBuilder: (context, index){
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey[100],
              boxShadow:[ BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0,10),
              ),
            ],),
            child: Row(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(countryData[index]['country'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      Image.network(countryData[index]['countryInfo']['flag'],
                      height: 40,
                      width: 60,),
                    ],
                  ),
                ),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('CONFIRMED: ' + countryData[index]['cases'].toString(),
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('ACTIVE: ' + countryData[index]['active'].toString(),
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),),

                    Text('RECOVERED: ' + countryData[index]['recovered'].toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),),

                    Text('DEATHS: ' + countryData[index]['deaths'].toString(),
                    style: TextStyle(
                        color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                )),
              ],
            ),
          );

      }),
    );
  }
}