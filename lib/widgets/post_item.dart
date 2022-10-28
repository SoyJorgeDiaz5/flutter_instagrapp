import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String imageUrl;
  final String username;

  const PostItem({
    Key? key,
    required this.imageUrl,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 0.1)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      const SizedBox(width: 8),
                      Text(username),
                    ],
                  ),
                  const Icon(Icons.more_vert)
                ],
              ),
            ),
            Image(
              height: 300,
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
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
      ),
    );
  }
}
