import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String author;

  // ignore: use_key_in_widget_constructors
  const BlogTile(
      {required this.imageUrl,
      required this.desc,
      required this.title,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(author[0].toString()),
                    backgroundColor: Colors.white38,
                  ),
                  Text(author != 'null' ? author : 'Anonymous'),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.thumb_up_alt_outlined),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.comment),
                ],
              ),
            ],
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          desc,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 21,
          ),
        ),
      ]),
    );
  }
}
