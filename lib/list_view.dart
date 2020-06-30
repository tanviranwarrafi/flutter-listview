import 'package:flutter/material.dart';
import 'trip.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Trip> tripsList = [
    Trip("New York", DateTime.now(), DateTime.now(), 200.0, "Car"),
    Trip("WashingTon D.c", DateTime.now(), DateTime.now(), 450.0, "Bus"),
    Trip("Bangladesh", DateTime.now(), DateTime.now(), 90.0, "Train"),
    Trip("Dhaka", DateTime.now(), DateTime.now(), 170.0, "Plane"),
    Trip("Mohammadpur", DateTime.now(), DateTime.now(), 50.0, "Bike"),
  ];

  _showToast(String toast) {
    Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview Flutter'),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: tripsList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildTripCard(context, index)),
        ));
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return Container(
      child: InkWell(
        onTap: () {
          _showToast(trip.title);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(trip.title, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                  child: Row(children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("\$${trip.budget.toStringAsFixed(2)}", style: TextStyle(
                          fontSize: 30.0
                      )),
                      Spacer(),
                      Icon(Icons.directions_car),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
