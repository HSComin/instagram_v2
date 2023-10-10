import 'package:app_requisicao_http/usuarios_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  final List<UsuariosPost> usuario_post;

  const Inicio(this.usuario_post);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuario_post.length,
      itemBuilder: ((context, index){
        final usuariopost = usuario_post[index];

        return GestureDetector(
          child: Column(
            children: [
              //Nome de usuário e foto de perfil
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 25, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(usuariopost.usuario.imagem),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(usuariopost.usuario.nomeUsuario,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.more_vert, color: Colors.white,size: 25),
                    )
                  ],
                ),
              ),
              //Publicação
              Container(
                color: Colors.grey,
                height: 450,
                child: Image.network(usuariopost.usuario.imagem),
              ),
              //SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 15),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.heart, size: 35, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Icon(CupertinoIcons.conversation_bubble, size: 35, color: Colors.white),
                    ),
                    Icon(CupertinoIcons.paperplane, size: 35, color: Colors.white),
                    Spacer(),
                    Icon(CupertinoIcons.bookmark, size: 35, color: Colors.white),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(usuariopost.usuario.imagem),
                      radius: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Text('Curtido por ' + usuariopost.usuario.nome + ' '
                        + usuariopost.usuario.sobrenome + ' e outras \n'
                        + usuariopost.post.curtidas + ' pessoas',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Wrap(
                  children: [
                    Text(usuariopost.usuario.nomeUsuario,
                        style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        usuariopost.post.texto,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 6, top: 5),
                child: Row(
                  children: [
                    TextButton(onPressed: () => abrirModalComentarios(context),
                        child: Text(
                          'Ver todos os comentários', style: TextStyle(color: Colors.grey),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: Row(
                  children: [
                    Text('Há 2 dias',
                        style: TextStyle(color: Colors.grey, fontSize: 18)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('°   Ver tradução',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
  abrirModalComentarios(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_){
          return Container(
            decoration: BoxDecoration(
                color: Colors.black87
            ),
            height: 700,
            child: ListView.builder(
              itemCount: usuario_post.length,
              itemBuilder: ((context, index) {
                final usuariopost = usuario_post[index];

                return GestureDetector(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(usuariopost.usuario.imagem),
                              radius: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              usuariopost.usuario.nomeUsuario,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              '2 d',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              CupertinoIcons.heart, color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              usuariopost.comentario.comentario,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 22.5),
                            child: Text(
                              usuariopost.post.curtidas,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60, top: 15, bottom: 25),
                            child: Text(
                              'Responder',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 25),
                            child: Text(
                              'Ver Tradução',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              ),
            ),
          );
        }
    );
  }
}