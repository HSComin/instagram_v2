import 'dart:convert';
import 'package:app_requisicao_http/usuarios_post.dart';
import 'usuario.dart';
import 'package:app_requisicao_http/post.dart';
import 'package:app_requisicao_http/comentarios.dart';
import 'package:http/http.dart' as http;

Future<List<UsuariosPost>> getUsuariosPosts() async {
  List<UsuariosPost> postUsuarios = [];
  List<Comentarios> postComentarios = [];

  List<Post> posts = await getPosts() as List<Post>;
  List<Usuario> usuarios = await getUsuarios() as List<Usuario>;
  List<Comentarios> comentarios = await getComentarios() as List<Comentarios>;

  for (Post post in posts) {
    for (Usuario user in usuarios) {
      for (Comentarios comentario in comentarios) {
        if (post.id_usuario == user.id) {
          postUsuarios.add(UsuariosPost(usuario: user, post: post, comentario: comentario));

          if(post.id == comentario.post_id) {
            postComentarios.add(comentario);
            break;
          }
        }
        break;
      }
    }
  }
  return postUsuarios;
}

Future<List<Usuario>>getUsuarios() async {
  const baseUrl = 'https://dummyjson.com/users/?q=';
  final resposta = await http.get(Uri.parse(baseUrl));

  final json = jsonDecode(resposta.body)['users'];

  return List<Usuario>.from(json.map((elemento) {
    return Usuario.fromJson(elemento);
  }));
}

Future<List<Comentarios>>getComentarios() async{
  const baseUrl = 'https://dummyjson.com/comments?q=';
  final resposta = await http.get(Uri.parse(baseUrl));

  final json = jsonDecode(resposta.body)['comments'];

  return List<Comentarios>.from(json.map((elemento){
    return Comentarios.fromJson(elemento);
  }));
}

Future<List<Post>>getPosts() async{
  const baseUrl = 'https://dummyjson.com/posts/?q=';
  final resposta = await http.get(Uri.parse(baseUrl));

  final json = jsonDecode(resposta.body)['posts'];

  return List<Post>.from(json.map((elemento){
    return Post.fromJson(elemento);
  }));
}

