import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:ta/screens/detail_artifact.dart';

Future<List<Artifact>> fetchArtifact(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.npoint.io/ac17ab5e24590832eb14'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parseArtifact(response.body);
}

// A function that converts a response body into a List<Photo>.
List<Artifact> parseArtifact(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Artifact>((json) => Artifact.fromJson(json)).toList();
}

class ArtifactPage extends StatefulWidget {
  const ArtifactPage({Key? key}) : super(key: key);

  @override
  _ArtifactPageState createState() => _ArtifactPageState();
}

class _ArtifactPageState extends State<ArtifactPage> {
  late Future<Artifact> futureArtifact;
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Artifact>>(
        future: fetchArtifact(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ArtifactList(artifact: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ArtifactList extends StatelessWidget {
  const ArtifactList({Key? key, required this.artifact}) : super(key: key);

  final List<Artifact> artifact;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: artifact.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailArtifact(
                            id: artifact[index].id,
                          )));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  artifact[index].images,
                  scale: 1.5,
                ),
                Padding(
                  padding: new EdgeInsets.all(10),
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    artifact[index].name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Artifact {
  final int id;
  final String name;
  final int maxRarity;
  final String s2PieceBonus;
  final String s4PieceBonus;
  final String images;

  Artifact(
      {required this.id,
      required this.name,
      required this.maxRarity,
      required this.s2PieceBonus,
      required this.s4PieceBonus,
      required this.images});

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      id: json['id'] as int,
      name: json['name'] as String,
      maxRarity: json['max_rarity'] as int,
      s2PieceBonus: json['2-piece_bonus'] as String,
      s4PieceBonus: json['4-piece_bonus'] as String,
      images: json['images'] as String,
    );
  }
}
