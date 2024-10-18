import 'package:flutter/material.dart';
import 'package:instagram_clone/data/story_data.dart';

class MyStory extends StatelessWidget {
  MyStory({super.key});

  final decoratorsInside = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final decoratorsOutline = BoxDecoration(
    gradient: const LinearGradient(colors: [
      Colors.pinkAccent,
      Colors.orange,
      Colors.orangeAccent,
      Colors.pink
    ]),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(32),
  );

  final decoratorsOutlineNoStory = BoxDecoration(
    gradient: const LinearGradient(colors: [Colors.white, Colors.grey]),
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(32),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: stories.map((story) {
              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: story.seen
                        ? decoratorsOutlineNoStory
                        : decoratorsOutline,
                    child: Container(
                      padding: const EdgeInsets.all(
                        2,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: FadeInImage(
                          image: NetworkImage(story.image, scale: 0.1),
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                          placeholder: const AssetImage(
                            'assets/placeholderforavatar.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    story.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
