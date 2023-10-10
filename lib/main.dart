import 'package:app_requisicao_http/lista_post_usuarios.dart';
import 'package:app_requisicao_http/repositorio.dart';
import 'package:app_requisicao_http/Telas/adicionar.dart';
import 'package:app_requisicao_http/Telas/perfil.dart';
import 'package:app_requisicao_http/Telas/pesquisar.dart';
import 'package:app_requisicao_http/Telas/reels.dart';
import 'package:app_requisicao_http/lista_stories.dart';
import 'package:app_requisicao_http/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'barrainferior.dart';

void main() {
  runApp(MaterialApp(
    home: Instagram(),
    debugShowCheckedModeBanner: false,
  ));
}

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  int indice = 0;
  Future<List<Usuario>>? futureUsuarios;

  void initState() {
    futureUsuarios = getUsuarios();
    super.initState();
  }

  List<Widget> telas = [
    ListaPostUsuario(),
    Pesquisar(),
    Adicionar(),
    Reels(),
    Perfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //toolbarHeight: 270,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.network(
              "https://logodownload.org/wp-content/uploads/2017/04/instagram-logo-4.png",
              scale: 16,
              color: Colors.white
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              CupertinoIcons.heart,
              color: Colors.white,
              size: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.bolt_horizontal_circle,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
          child: Column(
              children:[
                Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ListaStories()
                ),
                telas[indice],
              ]
          )
      ),

      bottomNavigationBar: BarraInferior(indice, onTabTapped),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      indice = index;
    });
  }
}
