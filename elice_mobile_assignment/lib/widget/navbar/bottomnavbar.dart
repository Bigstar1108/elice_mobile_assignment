import 'package:flutter/material.dart';

class EliceBottomNavBar extends StatefulWidget {
  EliceBottomNavBar({@required this.onTappedItem});

  final Function onTappedItem;

  @override
  _EliceBottomNavBar createState() => _EliceBottomNavBar();
}

class _EliceBottomNavBar extends State<EliceBottomNavBar> {
  int _currentIndex = 0;
  Function onTappedItem;

  @override
  void initState() {
    super.initState();
    onTappedItem = widget.onTappedItem;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'QR',
        ),
      ],
      selectedItemColor: Colors.blue,
      currentIndex: _currentIndex,
      onTap: (index) {
        onTappedItem(index);
        this.setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
