import 'package:flutter/material.dart';

class WorldwidePanels extends StatelessWidget {

  final Map worldData;

  const WorldwidePanels({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2,
        ),
        children: <Widget>[

          StatusPanel(
            title: 'Confirmed',
            panelColor: Colors.blue[200],
            textColor: Colors.blue[900],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: Colors.orange[200],
            textColor: Colors.orange[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: Colors.red[200],
            textColor: Colors.red[900],
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: Colors.greenAccent[200],
            textColor: Colors.green[800],
            count: worldData['recovered'].toString(),
          ),

        ],
      ),
    );
  }
}


class StatusPanel extends StatelessWidget {

  final Color? panelColor;
  final Color? textColor;
  final String title;
  final String count;

  const StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
       margin: const EdgeInsets.all(8.0),
      height: 80, width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
          style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: textColor,
          ),
          ),
          Text(count,
            style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor,
            ),
          ),
        ],
      ),


    );
  }
}

