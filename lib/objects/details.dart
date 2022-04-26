import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String uId;
  final String history;
  const Details({Key? key, required this.uId, required this.history})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'location-img-$uId',
                      child: Image.asset(
                        'assets/images/history-content/$history',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Liked');
                            },
                            child: const Text('Liked'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Disliked');
                            },
                            child: const Text('Disliked!'),
                          ),
                        )
                      ])
                ],
              ),
            )
          ],
        ));
  }
}
