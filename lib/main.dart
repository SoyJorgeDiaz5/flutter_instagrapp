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
          const PostItem(),
          const PostItem(),
          const PostItem(),
          const PostItem(),
          const PostItem(),
          const PostItem(),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/4923041/pexels-photo-4923041.jpeg?auto=compress&cs=tinysrgb&w=600',
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Howard'),
                  ],
                ),
                const Icon(Icons.more_vert)
              ],
            ),
          ),
          const Image(
            height: 300,
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://images.pexels.com/photos/10756534/pexels-photo-10756534.jpeg?auto=compress&cs=tinysrgb&w=600',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.comment),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.share),
                    ),
                  ],
                ),
                const Icon(Icons.bookmark_add_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
