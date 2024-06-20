import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/iniciarsecion.dart';
import 'package:flutter_taller_01/screens/registrarse.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
        colorScheme: ColorScheme.light(
          secondary: Colors.redAccent, // Set the accent color here
        ).copyWith(background: Colors.blue),
      ),
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
            "https://images.pexels.com/photos/1723637/pexels-photo-1723637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Este es un servicio de streaming que ofrece una gran variedad de películas, series y documentales premiados en casi cualquier pantalla conectada a internet",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 40), // espacio entre el texto y los botones
        IniciarSecion(context),
        SizedBox(height: 20), // espacio entre los botones
        Registro(context),
      ],
    ),
  );
}

Widget IniciarSecion(context) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Aplicacion02()));
      },
      child: Text("Iniciar Sesión", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Cambia el color del fondo del botón
        foregroundColor: Colors.white, // Cambia el color del texto
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget Registro(context) {
  return Container(
    width: 200,
    child: OutlinedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Registrarse()));
      },
      child: Text("Registrarse", style: TextStyle(color: Colors.white)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, // Cambia el color del texto
        side: BorderSide(color: Colors.blueAccent, width: 2), // Cambia el color del borde
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

