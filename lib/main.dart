import 'package:flutter/material.dart';
import 'package:flutter_instagrapp/widgets/story.dart';
import 'package:flutter_instagrapp/widgets/post_item.dart';

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
        title: const Text(
          'Instagrapp',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.add_a_photo_outlined,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            // padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: stories
                  .map((story) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Story(
                          image: story.image,
                          name: story.name,
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: stories
                .map((post) =>
                    PostItem(imageUrl: post.image, username: post.name))
                .toList(),
          )
        ],
      ),
    );
  }
}
