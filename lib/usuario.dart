class Usuario{
  int id;
  String nome;
  String sobrenome;
  String nomeUsuario;
  String imagem;

  Usuario({
    required this.id,
    required this.nomeUsuario,
    required this.nome,
    required this.sobrenome,
    required this.imagem
  });

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['firstName'].toString(),
        sobrenome = json['lastName'].toString(),
        nomeUsuario = json['username'].toString(),
        imagem = json['image'].toString();
}