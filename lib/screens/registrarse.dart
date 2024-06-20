import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/iniciarsecion.dart';

void main() {
  runApp(Registrarse());
}

class Registrarse extends StatelessWidget {
  const Registrarse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registrarse',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.blueAccent,
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
      appBar: AppBar(
        title: const Text('Registrarse'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            Colors.transparent, // Cambia el color de fondo de la appBar
      ),
      body: Stack(
        children: [
          Image.network(
            'https://images.pexels.com/photos/2486168/pexels-photo-2486168.jpeg?auto=compress&cs=tinysrgb&w=600', // URL de la imagen de fondo
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Cuerpo(context),
        ],
      ),
    );
  }
}

Widget Cuerpo(context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        Nickname(),
        SizedBox(height: 20),
        Edad(),
        SizedBox(height: 20),
        User(),
        SizedBox(height: 20),
        Password(),
        SizedBox(height: 20),
        BotonReg(context),
      ],
    ),
  );
}

final TextEditingController _users = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _edad = TextEditingController();
final TextEditingController _nick = TextEditingController();
Widget Nickname() {
  return TextField(
    controller: _nick,
    decoration: InputDecoration(
      hintText: "Ingrese un nick",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white, // Cambia el color de fondo del campo de texto
    ),
  );
}
Widget Edad() {
  return TextField(
    controller: _edad,
    decoration: InputDecoration(
      hintText: "Ingrese su edad",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white, // Cambia el color de fondo del campo de texto
    ),
  );
}

Widget User() {
  return TextField(
    controller: _users,
    decoration: InputDecoration(
      hintText: "Ingrese un E-mail",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white, // Cambia el color de fondo del campo de texto
    ),
  );
}

Widget Password() {
  return TextField(
    controller: _password,
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Cree una contraseña",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white, // Cambia el color de fondo del campo de texto
    ),
  );
}
Widget BotonReg(context) {
  return ElevatedButton(
    onPressed: () {
      registrarse(context);
      guardarRD();

    },
    child: Text("Registrarse"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent, // Cambia el color de fondo del botón
      foregroundColor: Colors.white, // Cambia el color del texto del botón
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Future<void> registrarse(context) async {
  try {
    if (_users.text != null) {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _users.text,
        password: _password.text,
      );
      navegador(context);
    } else {}
    /////////////////////
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> guardarRD() async {
DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ _nick.text);
 await ref.set({
  "id": _nick.text,
  "email": _users.text,
  "edad": _edad.text,
});
}

void navegador(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Aplicacion02(),
    ),
  );
}
