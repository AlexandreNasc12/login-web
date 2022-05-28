import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        title: 'Minha tela de login',
        home: LoginPage(),
        debugShowCheckedModeBanner: false);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          children: [
            Menu(),
            // MediaQuery.of(context).size.width >= 980
            //     ? Menu()
            //     : SizedBox(), // Responsive
            //Body()
          ]),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _MenuItem(titulo: 'Home'),
              _MenuItem(titulo: 'Sobre'),
              _MenuItem(titulo: 'Contato'),
              _MenuItem(titulo: 'Ajuda')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_MenuItem(titulo: 'Condastro'), _registrarBotao()],
          ),
        ],
      ),
    );
  }

//Componente de Item de Menu
  Widget _MenuItem({String titulo = 'Titulo do Menu', estaAtivo = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: estaAtivo ? Colors.deepPurple : Colors.grey,
                )),
            const SizedBox(
              height: 6,
            ),
            estaAtivo
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  //Registro botão
  Widget _registrarBotao() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 6,
            ),
          ]),
      child: const Text(
        'Registrar',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }

  class Body extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Cadastre-se em minha aplicação',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } 
  }
}
