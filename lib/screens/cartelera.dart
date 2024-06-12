import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/iniciarsecion.dart';

void main(){
  runApp(Cartelera());
}

class Cartelera extends StatelessWidget {
  const Cartelera({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Cuerpo(),
    );
  }
}

Widget Cuerpo (){
  return(
    Column(
      children: <Widget>[],
    )
  );
}