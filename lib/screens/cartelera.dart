import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/Video.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Cartelera());
}

class Cartelera extends StatelessWidget {
  const Cartelera({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Carteleras(),
    );
  }
}

class Carteleras extends StatefulWidget {
  const Carteleras({Key? key});

  @override
  State<Carteleras> createState() => _CartelerasState();
}

class _CartelerasState extends State<Carteleras> {
  List<Map<dynamic, dynamic>> peliculasList = [];
  @override
    void initState() {
    super.initState();
    getData();
  }
   void getData() async {
    
    DatabaseReference productoRef = FirebaseDatabase.instance.ref('peliculas');
    productoRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateProductList(data);
    });
  }
    void updateProductList(dynamic data) {
    List<Map<dynamic, dynamic>> tempList = [];

    data.forEach((key, element) {
      //////////////////////////////////////////
      /// Se asigna la clave y valor a la lista temporal
      //////////////////////////////////////////
      tempList.add({
        "titulo": element['titulo'],
        "imagen": element['imagen'],
        "video": element['video'], 
      });
    });

    setState(() {
      peliculasList = tempList;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteleras'),
        backgroundColor: Colors.blue, // Cambia el color de fondo de la appBar
        elevation: 0,
      ),
      body: Body(peliculasList: peliculasList),
    );
  }
  
}
class Body extends StatelessWidget {
  final List<Map<dynamic, dynamic>> peliculasList;
  final List<Map<String, String>> movies = [
    {
      "title": "grand theft auto v",
      "image":
          "https://cdn1.epicgames.com/0584d2013f0149a791e7b9bad0eec102/offer/GTAV_EGS_Artwork_1200x1600_Portrait%20Store%20Banner-1200x1600-382243057711adf80322ed2aeea42191.jpg",
        "video":"https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FGrand%20Theft%20Auto%20V%20Trailer%20(1).mp4?alt=media&token=cd4ffa8e-cade-40cf-95f6-b16c03eb61bc"
    },
    {
      "title": "Minions",
      "image":
          "https://static.wikia.nocookie.net/doblaje/images/2/25/Minions_nace_un_nuevo_villano_poster_final.png/revision/latest?cb=20220612175049&path-prefix=es",
                  "video":"https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FMinions%20Nace%20un%20Villano%20%E2%80%93%20Tr%C3%A1iler%20Oficial%20(Universal%20Pictures)%20HD.mp4?alt=media&token=c9e3e296-0365-4772-96da-c7b7898dcdbe"

    },
    {
      "title": "Transformers 7",
      "image":
          "https://i.pinimg.com/474x/e3/f5/63/e3f563526ed3c56f26de228f273cdb59.jpg",
                  "video":"https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FTRANSFORMERS%207%20EL%20DESPERTAR%20DE%20LAS%20BESTIAS%20Tr%C3%A1iler%20Espa%C3%B1ol%20Latino%20(2023)%20%E1%B4%B4%E1%B4%B0.mp4?alt=media&token=9305e1a1-b53b-4f0c-9194-859a93cd523a"

    },
  ];

  Body({required this.peliculasList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: ListView.builder(
        itemCount: peliculasList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(peliculasList[index]["imagen"]),
            ),
            title: Text(peliculasList[index]["titulo"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                      videoUrl: peliculasList[index]["video"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}