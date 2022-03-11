import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      selectedFontSize : 12.0,
      unselectedFontSize : 12.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search ),
            label: 'Search',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Just For You',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'My Profile',
        
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      );
  }
}