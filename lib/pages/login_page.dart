import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_api.dart';
import 'package:carros/pages/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
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
            AppText(
              "Login",
              "Digite o login",
              controller: _txtLogin,
              validator: _validateLogin,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
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
            AppButton(
              "Login",
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                String login = _txtLogin.text;
                String senha = _txtSenha.text;

                Usuario user = await LoginApi.login(login, senha);
                if(user != null) {
                  push(context, HomePage());
                }else{
                  print("Login incorreto");
                }
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
    if (texto.length < 3) {
      return "A senha deve ter pelo menos 8 caracteres!";
    }
    return null;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Carros"),
    );
  }
}
