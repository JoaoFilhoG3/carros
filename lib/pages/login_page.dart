import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _txtLogin = TextEditingController();
  final _txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _buildTextFormField("Login", "Digite o login", controller: _txtLogin),
          SizedBox(
            height: 10,
          ),
          _buildTextFormField("Senha", "Digite sua senha",
              controller: _txtSenha, password: true),
          SizedBox(
            height: 20,
          ),
          _buildButton(
            "Login",
            () {
              String login = _txtLogin.text;
              String senha = _txtSenha.text;
            },
          ),
        ],
      ),
    );
  }

  Container _buildButton(String text, Function onPressed()) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  TextFormField _buildTextFormField(String label, String hint,
      {bool password = false, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Carros"),
    );
  }
}
