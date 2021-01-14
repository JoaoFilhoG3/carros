class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map) {
    login = map["login"] as String;
    nome = map["nome"] as String;
    email = map["email"] as String;
    token = map["token"] as String;
    roles = map["roles"] != null
        ? map["roles"].map<String>((role) => role.toString()).toList
            as List<String>
        : null;
  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token}';
  }
}
