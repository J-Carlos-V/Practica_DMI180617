import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';

void main() {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List empleadosData;

  getEmpleados() async {
    http.Response response =
        await http.get(Uri.parse("http://127.0.0.1:3000/"));
    Map data = json.decode(response.body);
    setState(() {
      empleadosData = data['empleados'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmpleados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Empleados'),
        backgroundColor: Colors.purpleAccent[700],
      ),
      body: ListView.builder(
        itemCount: empleadosData == null ? 0 : empleadosData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[Text("${empleadosData[index]["_id"]}")],
            ),
          );
        },
      ),
    );
  }
}
