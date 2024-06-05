import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/iniciarsecion.dart';
import 'package:flutter_taller_01/screens/registrarse.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
      
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            "https://media.istockphoto.com/id/1303344250/es/foto/streaming-de-televisi%C3%B3n-concepto-de-pared-multimedia.jpg?s=1024x1024&w=is&k=20&c=YehKtFDeq-q0Vw6R8Q3VWefATgmH888T21MDrhBhc4Y="),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Este es un servicio de streaming que ofrece una gran variedad de películas, series y documentales premiados en casi cualquier pantalla conectada a internet",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 24, 24, 24),
          ),
        ),
        SizedBox(height: 20), // espacio entre el texto y los botones
        IniciarSecion(context),
        SizedBox(height: 10), // espacio entre los botones
        Registro(context),
      ],
    ),
  );
}

Widget IniciarSecion(context) {
  return Container(
    child:
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Aplicacion02()));
        }, child: Text("Iniciar Secion"), 
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),),
  );
}

Widget Registro(context) {
  return(
   FilledButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registrarse()));
   }, child: const Text("Registrarse"))
  );
}
