import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap; // Callback for when an item is tapped

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.onTap, // Make onTap optional, or required depending on your use case
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTap, // Pass the onTap callback to the BottomNavigationBar
      items: const [ // Use const for BottomNavigationBarItem if they don't change
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}