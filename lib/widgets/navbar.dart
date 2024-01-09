import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> with TickerProviderStateMixin {
  var _selectedTab = _SelectedTab.home;
  final Color _selectedColor = Colors.blueGrey;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );
    return DotNavigationBar(
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),

      // Hide dot
      dotIndicatorColor: Colors.transparent,

      onTap: _handleIndexChanged,
      itemPadding: const EdgeInsets.all(16),
      marginR: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      paddingR: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      items: [
        /// Home
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
          selectedColor: _selectedColor,
        ),

        /// Search
        DotNavigationBarItem(
          icon: const Icon(Icons.search),
          selectedColor: _selectedColor,
        ),

        // Social media blog
        DotNavigationBarItem(
          icon: const Icon(Icons.article_outlined),
          selectedColor: _selectedColor,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
          selectedColor: _selectedColor,
        ),
      ],
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
