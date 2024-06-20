import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/cartelera.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  runApp(Aplicacion02());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Aplicacion02 extends StatelessWidget {
  const Aplicacion02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.blue, // Cambia la imagen de fondo por un color azul
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Usuario(),
        Password(),
        Boton(context),
      ],
    ),
  );
}

final TextEditingController _user = TextEditingController();
Widget Usuario() {
  return Container(
    padding: EdgeInsets.all(20),
    child: TextField(
      controller: _user,
      decoration: InputDecoration(
        hintText: "Ingrese nickname",
        fillColor: Colors.white, // Cambia el color del fondo del campo de texto
        filled: true,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget Password() {
   return Container(
    padding: EdgeInsets.all(20),
    child: TextField(
      controller: _pass,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Ingrese Contraseña",
        fillColor: Colors.white, // Cambia el color del fondo del campo de texto
        filled: true,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

final TextEditingController _pass = TextEditingController();

Widget Boton(context) {
  return Container(
    child: ElevatedButton(
      onPressed: () {
        //imprimir();
        login(context);
      },
      child: Text("Login"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Cambia el color del fondo del botón
        foregroundColor: Colors.white, // Cambia el color del texto del botón
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

final TextEditingController _controller = TextEditingController();
Future<void> login(context) async {
  try {
    if (_user.text != null) {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _user.text, password: _pass.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cartelera()));
    } else {}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
