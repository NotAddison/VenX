import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './navbar.dart';

// Custom widget (params = more child objs)

class Base extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showNavBar;
  final bool showAppBar;

  const Base({
    super.key,
    required this.body,
    this.title = 'VenX',
    this.showNavBar = true,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: () => {Navigator.pop(context)},
              ),
            )
          : null,
      body: body,
      bottomNavigationBar: showNavBar ? const NavBar() : null,
    );
  }
}
