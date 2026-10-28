import 'package:flutter/material.dart';

import 'about_page.dart';
import 'gallery_page.dart';
import 'home_page.dart';

/// Pastki navigatsiya paneli (BottomNavigationBar) va ekranlar almashishi.
class HomeShell extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomeShell({super.key, required this.onToggleTheme});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(
        onToggleTheme: widget.onToggleTheme,
        onOpenAbout: () => setState(() => currentIndex = 1),
      ),
      const AboutPage(),
      const GalleryPage(),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: const Color(0xFF1E1E1E)),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E1E1E),
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.tealAccent,
          unselectedItemColor: const Color(0xFF9DB2CE),
          iconSize: 24,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Bosh sahifa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Men haqimda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Rasmlarim',
            ),
          ],
        ),
      ),
    );
  }
}
