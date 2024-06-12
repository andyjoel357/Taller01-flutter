import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/iniciarsecion.dart';

void main() {
  runApp(Registrarse());
}

class Registrarse extends StatelessWidget {
  const Registrarse({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
Widget User() {
  return TextField(
    controller: _users,
    decoration: InputDecoration(
      hintText: "Cree su usuario",
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
  );
}

final TextEditingController _password = TextEditingController();
Widget Password() {
  return TextField(
    controller: _password,
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Cree una contraseña",
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
  );
}

Widget BotonReg(context) {
  return ElevatedButton(
    onPressed: () {
      registrarse(context);
    },
    child: Text("Registrarse"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // background color
      foregroundColor: Colors.white, // text color
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Future<void> registrarse(context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _users.text,
      password: _password.text,
    );
    /////////////////////
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Aplicacion02(),
      ),
    );
    /// 
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