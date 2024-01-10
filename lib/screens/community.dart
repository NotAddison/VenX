import 'package:flutter/material.dart';
import '../widgets/base.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return const Base(
      showNavBar: false,
      body: Placeholder(),
      title: 'Community',
    );
  }
}
