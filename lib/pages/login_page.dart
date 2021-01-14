import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildTextFormField(
              "Login",
              "Digite o login",
              controller: _txtLogin,
              validator: _validateLogin,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 10,
            ),
            _buildTextFormField(
              "Senha",
              "Digite sua senha",
              controller: _txtSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            _buildButton(
              "Login",
              () {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                String login = _txtLogin.text;
                String senha = _txtSenha.text;
              },
            ),
          ],
        ),
      ),
    );
  }

  String _validateLogin(String texto) {
    if (texto.isEmpty) {
      return "Campo login obrigatório!";
    }
    return null;
  }

  String _validateSenha(String texto) {
    if (texto.isEmpty) {
      return "Campo senha obrigatório!";
    }
    if (texto.length < 8) {
      return "A senha deve ter pelo menos 8 caracteres!";
    }
    return null;
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

  TextFormField _buildTextFormField(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
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
