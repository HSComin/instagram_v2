import 'package:app_requisicao_http/Telas/inicio.dart';
import 'package:app_requisicao_http/repositorio.dart';
import 'package:app_requisicao_http/usuarios_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPostUsuario extends StatefulWidget {

  @override
  State<ListaPostUsuario> createState() => _ListaPostUsuarioState();
}

class _ListaPostUsuarioState extends State<ListaPostUsuario> {
  Future<List<UsuariosPost>>? futureUsuarioPost;

  @override
  void initState() {
    futureUsuarioPost = getUsuariosPosts();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: FutureBuilder(
        future: futureUsuarioPost,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final usuariosposts = snapshot.data as List<UsuariosPost>;
            return Inicio(usuariosposts);
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
