import 'package:flutter/material.dart';
import 'package:flutter_instagrapp/widgets/story.dart';

import 'package:flutter_instagrapp/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InstagrappHome(),
    );
  }
}

class InstagrappHome extends StatelessWidget {
  const InstagrappHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagrapp'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: stories
            .map((story) => Story(
                  image: story.image,
                  name: story.name,
                ))
            .toList(),
      ),
    );
  }
}
