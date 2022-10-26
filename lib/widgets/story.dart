import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String image;
  final String name;

  const Story({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleColor(),
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(
                image,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(name)
      ],
    );
  }
}

class CircleColor extends StatelessWidget {
  const CircleColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 86,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffee0000),
                Color(0xffeeee00),
              ])),
    );
  }
}
