import 'package:flutter/material.dart';
import 'usuario.dart';

class Stories extends StatelessWidget {
  final List<Usuario> stories;

  Stories(this.stories);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: stories.length,
      itemBuilder: ((context, index) {
        final storie = stories[index];
        return Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                      color: Colors.red, width: 4
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 90,
                  height: 90,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(storie.imagem),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: 5
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(storie.nomeUsuario, style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
            ],
          ),
        );;
      }),
    );
  }
}
