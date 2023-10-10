class Post{
  int id;
  int id_usuario;
  String texto;
  String curtidas;

  Post({
    required this.id,
    required this.id_usuario,
    required this.texto,
    required this.curtidas,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        id_usuario = json['userId'],
        texto = json['body'].toString(),
        curtidas = json['reactions'].toString();
}