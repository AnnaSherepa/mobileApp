import 'dart:convert';

import 'package:app/my_widgets/my_common_bottom_navbar.dart';
import 'package:app/objects/recommendation_post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReccomendationPage extends StatefulWidget {
  const ReccomendationPage({Key? key}) : super(key: key);

  @override
  State<ReccomendationPage> createState() => _ReccomendationPageState();
}

class _ReccomendationPageState extends State<ReccomendationPage> {
  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://picsum.photos/v2/list'));

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
         
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
             return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].downloadUrl);
      },
    );
  }
}
