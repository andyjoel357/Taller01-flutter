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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
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
        backgroundColor: Colors.blue, // Cambia el color de fondo de la appBar
        elevation: 0,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      "title": "grand theft auto v",
      "image":
          "https://cdn1.epicgames.com/0584d2013f0149a791e7b9bad0eec102/offer/GTAV_EGS_Artwork_1200x1600_Portrait%20Store%20Banner-1200x1600-382243057711adf80322ed2aeea42191.jpg",
      "video":
          "https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FGrand%20Theft%20Auto%20V%20Trailer%20(1).mp4?alt=media&token=cd4ffa8e-cade-40cf-95f6-b16c03eb61bc"
    },
    {
      "title": "Minions",
      "image":
          "https://static.wikia.nocookie.net/doblaje/images/2/25/Minions_nace_un_nuevo_villano_poster_final.png/revision/latest?cb=20220612175049&path-prefix=es",
      "video":
          "https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FMinions%20Nace%20un%20Villano%20%E2%80%93%20Tr%C3%A1iler%20Oficial%20(Universal%20Pictures)%20HD.mp4?alt=media&token=c9e3e296-0365-4772-96da-c7b7898dcdbe"
    },
    {
      "title": "Transformers 7",
      "image":
          "https://i.pinimg.com/474x/e3/f5/63/e3f563526ed3c56f26de228f273cdb59.jpg",
      "video":
          "https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2FTRANSFORMERS%207%20EL%20DESPERTAR%20DE%20LAS%20BESTIAS%20Tr%C3%A1iler%20Espa%C3%B1ol%20Latino%20(2023)%20%E1%B4%B4%E1%B4%B0.mp4?alt=media&token=9305e1a1-b53b-4f0c-9194-859a93cd523a"
    },
    {
      "title":"Bad Boys",
      "image":"https://www.badboys.movie/images/synopsis_poster.jpg",
      "video":"https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2F1718975918329_original-cad6c8a8-a39f-47de-9d4c-c4d807879e4c.mp4?alt=media&token=74a4e208-006b-45da-a552-1bd16270a5e2"
    },
    {
      "title":"Kung fu Panda",
      "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqofqcrQVU5Dswj9f_y4QL9UhVyj2OoKMFlw&s",
      "video":"https://firebasestorage.googleapis.com/v0/b/prueba1-45273.appspot.com/o/Movies%2F1718975918473_original-4b77b2bf-5b41-4b84-839c-1a29e66aaeff.mp4?alt=media&token=760346e2-7bb0-4b45-966a-1923c3230c1a"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FutureBuilder(
                        future: precacheImage(
                          NetworkImage(movies[index]["image"]!),
                          context,
                        ),
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              width: 120,
                              height: 180,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return SizedBox(
                              width: 120,
                              height: 180,
                              child: Center(
                                child: Text(
                                  "Error de carga de imagen",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 120,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(movies[index]["image"]!),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      Text(
                        movies[index]["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Seleccione una pelicula para ver",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index]["image"]!),
                  ),
                  title: Text(movies[index]["title"]!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                            videoUrl: movies[index]["video"].toString()),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
