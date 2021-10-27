import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';
/*
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
  List? empleadosData;
  Map? data;
  getEmpleados() async {
    var url = Uri.parse("http://192.168.1.64:3000");
    http.Response response = await http.get(url);
    //Map data = json.decode(response.body);
    debugPrint(response.body);
    /*setState(() {
      empleadosData = data['empleados'];
    });*/
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
      /*body: ListView.builder(
        itemCount: empleadosData == null ? 0 : empleadosData?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[Text("${empleadosData?[index]["nombre"]}")],
            ),
          );
        },
      ),*/
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<List<Empleados>>? _listE;
  Future<List<Empleados>>? _getEmpleados(){
    final response = http.get()
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App_Empleados_180617',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

class Empleados{
  late String nombre;
  late String url;

  Empleados(nombre, url){
    this.nombre = nombre;
    this.url = url;
    
  }


}*/

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List> Empleados() async{
    var url = Uri.parse("http://192.168.1.64:3000");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP Empleados 180617"),
      ),
      body: FutureBuilder<List>(
        future: Empleados(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Center(
              child: Text("Error al traer Empleados"),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data![index]['nombre']),
                );
              },);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        )
    );
  }
}