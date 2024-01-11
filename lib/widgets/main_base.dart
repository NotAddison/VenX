import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

// Pages
import '../screens/home.dart';
import '../screens/community.dart';
import '../screens/bookmarks.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  createState() => _MainScaffoldState();
}

// Main Base Widget
// : base sacffold for all pages, consists of appbar and bottom nav bar, body = page content

class _MainScaffoldState extends State<MainScaffold>
    with TickerProviderStateMixin {
  final pages = [
    const Community(),
    const Home(),
    const Bookmarks(),
  ];

  var currentIndex = 1;
  final _selectedColor = const Color.fromARGB(255, 7, 105, 184);

  void _handleIndexChanged(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: currentIndex,
        onTap: _handleIndexChanged,

        // Styling
        borderRadius: 15,
        dotIndicatorColor: Colors.transparent,
        itemPadding: const EdgeInsets.all(16),
        marginR: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        paddingR: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),

        // Navigation Buttons
        items: [
          // Social media blog
          DotNavigationBarItem(
            icon: const Icon(Icons.message_outlined),
            selectedColor: _selectedColor,
          ),

          // Map (Home)
          DotNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            selectedColor: _selectedColor,
          ),

          // Saves
          DotNavigationBarItem(
            icon: const Icon(Icons.bookmark_border_rounded),
            selectedColor: _selectedColor,
          ),
        ],
      ),
    );
  }
}
