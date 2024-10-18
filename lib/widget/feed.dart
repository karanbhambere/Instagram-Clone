import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:instagram_clone/data/feed_data.dart';
import 'package:instagram_clone/model/feed.dart';

class FeedSection extends StatelessWidget {
  const FeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final item = posts[index];
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRect(
                            child: Image(
                              image: NetworkImage(posts[index].useravatar),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts[index].username),
                              Text(
                                posts[index].profileCaption,
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                ),
                _FeedCaption(post: item),
                FadeInImage(
                  placeholder: const AssetImage('assets/placeholder.jpg'),
                  image: NetworkImage(item.feedImage),
                  width: MediaQuery.of(context).size.width,
                ),
                _FeedButton(post: item),
                _FeedStats(post: item)
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FeedStats extends StatelessWidget {
  final Feed post;
  const _FeedStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "${post.likes} likes",
            style: const TextStyle(color: Colors.red, fontSize: 12))
      ])),
    );
  }
}

class _FeedCaption extends StatelessWidget {
  final Feed post;

  const _FeedCaption({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: (post.username),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " ${post.caption}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.topLeft,
          child: const Text(
            'February 2020',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}

class _FeedButton extends StatelessWidget {
  final Feed post;

  const _FeedButton({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.heart,
                color: Colors.grey[800],
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.messageCircle,
                color: Colors.grey[800],
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.send,
                color: Colors.grey[800],
                size: 25,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FeatherIcons.bookmark,
            color: Colors.grey[800],
            size: 25,
          ),
        ),
      ],
    );
  }
}
