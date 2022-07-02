// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

bool isNewsLiked = false;
int year = DateTime.now().year;
int hourInMin = 60 * DateTime.now().hour;
int minutes = hourInMin + DateTime.now().minute;

var description;
var urlLink;

class BlogTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String author;
  final String timestamp;
  final String url;

  // ignore: use_key_in_widget_constructors
  const BlogTile(
      {required this.imageUrl,
      required this.desc,
      required this.title,
      required this.author,
      required this.timestamp,
      required this.url
      });

  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {

  @override
  Widget build(BuildContext context) {

   urlLink = widget.url;
    description = widget.desc;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              placeholder: (context, url) => SizedBox(
                width: 50,
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Naulo",
                        style: GoogleFonts.pacifico(fontSize: 30,color: Colors.red),
                      ),
                      Text(
                        "News",
                        style: GoogleFonts.pacifico(fontSize: 30,color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
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
                    child: Text(widget.author[0]),
                    backgroundColor: Colors.white38,
                  ),
                  Text(widget.author.isNotEmpty ? widget.author : ""),
                ],
              ),
              //Add
              Text(widget.timestamp),
              Row(
                children: [
                  const Icon(
                    Icons.thumb_up_alt_rounded,
                    color: Colors.transparent,
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      Share.share(
                          "${widget.title}\n\n${widget.desc}\n\n\nGet NauloNews at https://www.linkedin.com/sangamsharma600");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.desc,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 21,
            ),
          ),
        ),
        const Text("Swipe right to see full news.➡",style: TextStyle(color: Colors.black26,fontSize: 12),)
      ]),
    );
  }
}
