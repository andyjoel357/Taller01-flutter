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
        primaryColor: Colors.black,
        colorScheme: ColorScheme.light(
          secondary: Colors.redAccent, // Set the accent color here
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
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
          style: Theme.of(context).textTheme.headlineLarge,
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
      child: Text("Iniciar Sesión"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor, // Use backgroundColor instead of primary
        foregroundColor: Colors.white, // Use foregroundColor instead of onPrimary
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
      child: Text("Registrarse"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary, // Use foregroundColor instead of primary
        side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2), // Use colorScheme.secondary instead of accentColor
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}