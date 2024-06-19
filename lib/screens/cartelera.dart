import 'package:flutter/material.dart';
import 'package:flutter_taller_01/screens/Video.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteleras'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      "title": "Deadóol 3",
      "image":
          "https://cdnb.artstation.com/p/assets/images/images/050/326/635/large/rahal-nejraoui-deapdool-3-poster-4-by-rahalarts.jpg?1654601588"
    },
    {
      "title": "Sonic 2",
      "image":
          "https://pics.filmaffinity.com/Sonic_2_La_pelaicula-456166633-large.jpg"
    },
    {
      "title": "La gritona",
      "image":
          "https://losmitosyleyendas.com/wp-content/uploads/2024/02/image-87.jpg"
    },
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
              "Más Carteleras",
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
                        builder: (context) => Video(),
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
