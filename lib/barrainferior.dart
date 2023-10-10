import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraInferior extends StatelessWidget {
  final int indice;
  Function(int) onTabTapped;

  BarraInferior(this.indice, this.onTabTapped);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indice,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      onTap: (onTabTapped),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.white, size: 35),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white, size: 35),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_app, color: Colors.white, size: 35),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined, color: Colors.white, size: 35),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Container(
              width: 35,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://img.freepik.com/vetores-premium/homem-perfil-caricatura_18591-58482.jpg?w=2000', scale: 5),
              ),
            ),
            label: ''
        ),
      ],
    );
  }
}
