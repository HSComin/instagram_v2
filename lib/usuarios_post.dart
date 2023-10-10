import 'post.dart';
import 'usuario.dart';
import 'comentarios.dart';

class UsuariosPost {
  Usuario usuario;
  Post post;
  Comentarios comentario;

  UsuariosPost({
    required this.usuario,
    required this.post,
    required this.comentario,
  });

}