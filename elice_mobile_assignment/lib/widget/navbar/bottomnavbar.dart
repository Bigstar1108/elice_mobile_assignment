import 'package:flutter/material.dart';

class EliceBottomNavBar extends StatefulWidget {
  EliceBottomNavBar({@required this.onTappedItem});

  final Function onTappedItem;

  @override
  _EliceBottomNavBar createState() => _EliceBottomNavBar();
}

const SelectedItemColor = const Color(0xFF524aa1);
const UnSelectedItemColor = const Color(0xFF8d8a8a);

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
          icon: Icon(Icons.account_balance_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          label: 'QR',
        ),
      ],
      selectedItemColor: SelectedItemColor,
      unselectedItemColor: UnSelectedItemColor,
      selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      currentIndex: _currentIndex,
      onTap: (index) {
        onTappedItem(index);
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
