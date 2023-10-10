import 'package:app_requisicao_http/repositorio.dart';
import 'package:app_requisicao_http/stories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_requisicao_http/usuario.dart';

class ListaStories extends StatefulWidget {

  @override
  State<ListaStories> createState() => _ListaStoriesState();
}

class _ListaStoriesState extends State<ListaStories> {
  Future<List<Usuario>>? futureStories;

  @override
  void initState() {
    futureStories = getUsuarios();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: FutureBuilder(
        future: futureStories,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final stories = snapshot.data as List<Usuario>;
            return Stories(stories);
          } else if(snapshot.hasError){
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(fontSize: 16),
              ),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
