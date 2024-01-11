import 'package:flutter/material.dart';
import '../widgets/sub_base.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Base(
      showNavBar: false,
      body: SingleChildScrollView(
        child: ListView(children: const []),
      ),
      title: 'Community',
    );
  }
}
