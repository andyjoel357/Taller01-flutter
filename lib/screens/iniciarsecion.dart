import 'package:flutter/material.dart';

void main() {
  runApp(Aplicacion02());
}

class Aplicacion02 extends StatelessWidget {
  const Aplicacion02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      
      appBar: AppBar(
        title: Text("Titulo superior")
      ),
      
      body: Body(),
      
    );
  }
}

Widget Body() {
  return Container(
    decoration: const BoxDecoration( 
      image: DecorationImage( 
        image: NetworkImage("https://images3.alphacoders.com/132/1322308.jpeg"),
        fit: BoxFit.cover
       )

    ) ,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Usuario(), 
        Password(),
        Boton(),
 
        ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget Usuario() {
  return Container(
    padding: EdgeInsets.all(20),
      child: const TextField(
    decoration: InputDecoration(
        hintText: "Ingrese nickname", fillColor: Colors.grey, filled: true),
  ));
}

// ignore: non_constant_identifier_names
Widget Password( ) {

  return Column(
    children: [
      Container(
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(60)
        ),
        padding: const EdgeInsets.all(20),
        child:  TextField(
          controller: _controller,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Ingrese Contraseña',
              fillColor: Colors.grey,
              filled: true,
              border: InputBorder.none, )
              ,
              keyboardType: TextInputType.number,
              
        ),
      ),
    ],
  );
}

Widget Boton(){
  return Container(

    child: ElevatedButton(
      onPressed:() {
        //imprimir();
        
        print(_controller.text);
      },
       child: Text("Login"),
       style: ElevatedButton.styleFrom( backgroundColor: Colors.amber )
    ),
  );
}

final TextEditingController _controller = TextEditingController();
