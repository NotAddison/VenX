import 'package:flutter/material.dart';
import '../widgets/sub_base.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return const Base(
      showNavBar: false,
      body: Placeholder(),
      title: 'Saved Machines',
    );
  }
}
