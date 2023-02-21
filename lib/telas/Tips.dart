import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kokedama/screen1.dart';

import 'Add.dart';
import 'Home.dart';
import 'Myplants.dart';

void main() {
  runApp(const Tips());
}

class Tips extends StatelessWidget {
  const Tips({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor mycolor = MaterialColor(
      const Color.fromRGBO(85, 194, 134, 1).value,
      const <int, Color>{
        50: Color.fromRGBO(85, 194, 134, 0.1),
        100: Color.fromRGBO(85, 194, 134, 0.2),
        200: Color(0x4B55C286),
        300: Color.fromRGBO(85, 194, 134, 0.4),
        400: Color.fromRGBO(85, 194, 134, 0.5),
        500: Color.fromRGBO(85, 194, 134, 0.6),
        600: Color.fromRGBO(85, 194, 134, 0.7),
        700: Color.fromRGBO(85, 194, 134, 0.8),
        800: Color.fromRGBO(85, 194, 134, 0.9),
        900: Color.fromRGBO(85, 194, 134, 1),
      },
    );

    return MaterialApp(
      title: 'TIPS',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color.fromRGBO(248, 248, 248, 1),
      ),
      home: const MyHomePage(title: 'kokedama'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // botão central
      // botão central
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        child: Icon(Icons.add_outlined, color: Colors.white),
      ),

      //
      // barra de navegação
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Color.fromRGBO(176, 176, 176, 1)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.home_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }),
                IconButton(
                    icon: Icon(Icons.explore_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Tips()),
                      );
                    }),
                const SizedBox(width: 24),
                IconButton(
                    icon: Icon(Icons.storefront_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Myplants()),
                      );
                    }),
                IconButton(
                    icon: Icon(Icons.engineering_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Tips()), // pensar
                      );
                    }),
              ],
            ),
          ),
        ),
      ),

      //
      //conteúdo da página
      body: Container(
        child: Column(
          // coluna
          children: <Widget>[
            // elementos
            Center(
              // centralizados
              child: Stack(
                // empilhados
                // elementos
                children: <Widget>[
                  SizedBox(height: 8),
                  //
                  //card verde
                  Container(
                    width: 1500,
                    height: 235,
                    child: AppBar(
                      title: Text("Teste"),
                      centerTitle: true,
                      elevation: 0.0,
                      leading: InkWell(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 100,
                          height: 100,
                          semanticLabel: 'Logo da aplicação',
                          //fit: BoxFit.contain,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ), //Container
                ],
              ),
            ),

            // Deamis elementos da página
            // elementos em coluna
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                )
              ]
              ,
            ),
          ],
        ),
      ),
    );
  }
}
