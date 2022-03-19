import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

bool isNewsLiked = false;
int year = DateTime.now().year;
int hourInMin = 60 * DateTime.now().hour;
int minutes = hourInMin + DateTime.now().minute;

var description;

class BlogTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String author;
  final String timestamp;

  // ignore: use_key_in_widget_constructors
  const BlogTile(
      {required this.imageUrl,
      required this.desc,
      required this.title,
      required this.author,
      required this.timestamp});


  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {

  @override
  Widget build(BuildContext context) {
    description = widget.desc;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              placeholder: (context, url) =>
                  const SizedBox(width: 50, child: LinearProgressIndicator()),
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
                      Share.share("${widget.title}\n\n${widget.desc}\n\n\nGet Newsify at https://www.facebook.com/sangamsharma600");
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
      ]),
    );
  }
}
