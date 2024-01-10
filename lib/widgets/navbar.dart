import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';

// Pages
import '../screens/home.dart';
import '../screens/community.dart';
import '../screens/machine.dart';

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

      // Handle navigation here (/w page transitions)
      switch (_selectedTab) {
        case _SelectedTab.social:
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const Community(),
            ),
          );
          break;
        case _SelectedTab.home:
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const Home(),
            ),
          );
          break;
        case _SelectedTab.saves:
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const MachineView(),
            ),
          );
          break;
      }
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
    );
  }
}

enum _SelectedTab { social, home, saves }
