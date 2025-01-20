import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<(String label, String path, IconData icon)> _navigationItems = const [
    ('Home', '/home', Icons.home),
    ('Products', '/products', Icons.shopping_bag),
    ('Flash Deals', '/flash-deals', Icons.flash_on),
    ('Cart', '/cart', Icons.shopping_cart),
    ('Profile', '/profile', Icons.person),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    context.go(_navigationItems[index].$2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: _navigationItems
            .map((item) => NavigationDestination(
                  icon: Icon(item.$3),
                  label: item.$1,
                ))
            .toList(),
      ),
    );
  }
}
