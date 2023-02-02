import 'package:flutter/material.dart';
import 'package:kokedama/screen1.dart';
import 'Add.dart';
import 'Myplants.dart';
import 'Tips.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kokedama',
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // botão central
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        child: const Icon(Icons.add_outlined),
      ),
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

      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Card(
              shadowColor: Colors.lightGreenAccent,
              color: Colors.green,
              child: SizedBox(
                width: 1500,
                height: 235,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              child: Container(
                width: 400,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://a-static.mlcdn.com.br/800x560/planta-samambaia-americana-cuia-25-super-cheia-c-haste-para-pendurar-biogarden/biogardengreen/02c630ce0cfb11edb0ff4201ac185079/f02328fa160858e09c404d5fdb97ab92.jpeg"), //NetworkImage
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: const ListTile(
                  title: Text('Demo Title'),
                  subtitle: Text('simple card in Flutter.'),
                ),
              ),
            ),

            // botão para entrar na aplicação
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onSurface: Colors.green,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: StadiumBorder(),
                  side: const BorderSide(
                    width: 0.5,
                    color: Color.fromRGBO(85, 194, 134, 1),
                  ) // desncessário, mas gostei
                  ),

              child: const Text(
                ' Fazer Login ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              }, // ainda sem nenhuma função
            ),

            // espaço
            SizedBox(height: 10),

            // gesture detector
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: const Text(
                'Continuar sem uma conta',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Open Sans', color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
