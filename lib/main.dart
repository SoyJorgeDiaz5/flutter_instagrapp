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

class InstagrappHome extends StatefulWidget {
  const InstagrappHome({Key? key}) : super(key: key);

  @override
  State<InstagrappHome> createState() => _InstagrappHomeState();
}

class _InstagrappHomeState extends State<InstagrappHome> {
  int _index = 0;

  final pagesList = const [
    InstagrappHome(),
    InstagrappProfile(),
  ];
  void onTapIndex(int index) {
    setState(() {
      _index = index;
    });
  }

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
      body: pagesList.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _index,
        onTap: onTapIndex,
      ),
    );
  }
}

class InstagrappFeed extends StatelessWidget {
  const InstagrappFeed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
              .map(
                  (post) => PostItem(imageUrl: post.image, username: post.name))
              .toList(),
        )
      ],
    );
  }
}

class InstagrappProfile extends StatelessWidget {
  const InstagrappProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile page!'),
    );
  }
}
