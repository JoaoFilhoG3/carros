import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Text(
        "João Filho",
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text("Carros"),
    );
  }
}
