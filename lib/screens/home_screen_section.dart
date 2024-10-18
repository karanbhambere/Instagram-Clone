import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/feed.dart';
import 'package:instagram_clone/widget/stories.dart';

class HomeScreenSection extends StatefulWidget {
  const HomeScreenSection({super.key});

  @override
  State<HomeScreenSection> createState() => _HomeSectionPageState();
}

class _HomeSectionPageState extends State<HomeScreenSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [MyStory(), const Divider(), const FeedSection()],
          ),
        ),
      ),
    );
  }
}
