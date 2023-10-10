class Comentarios{
  int id;
  String comentario;
  int post_id;

  Comentarios({
    required this.id,
    required this.comentario,
    required this.post_id,
  });

  Comentarios.fromJson(Map<String, dynamic> json)
      :id = json['id'],
        comentario = json['body'].toString(),
        post_id = json['postId'];

}