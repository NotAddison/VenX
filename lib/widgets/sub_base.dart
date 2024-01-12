import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Custom widget (params = more child objs)

class Base extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showNavBar;
  final bool showAppBar;
  final bool showReturnButton;

  const Base({
    super.key,
    required this.body,
    this.title = 'VenX',
    this.showNavBar = true,
    this.showAppBar = true,
    this.showReturnButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title),
              centerTitle: true,
              leading: showReturnButton == true
                  ? IconButton(
                      icon: const Icon(CupertinoIcons.back),
                      onPressed: () => {Navigator.pop(context)},
                    )
                  : null,
              scrolledUnderElevation: 0,
            )
          : null,
      body: body,
    );
  }
}
