import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Add.dart';
import 'Myplants.dart';
import 'Tips.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  //construção da paleta
  MaterialColor mycolor = MaterialColor(
    const Color.fromRGBO(85, 194, 134, 1).value,
    const <int, Color>{
      50: Color.fromRGBO(85, 194, 134, 0.1),
      100: Color.fromRGBO(85, 194, 134, 0.2),
      200: Color.fromRGBO(85, 194, 134, 0.3),
      300: Color.fromRGBO(85, 194, 134, 0.4),
      400: Color.fromRGBO(85, 194, 134, 0.5),
      500: Color.fromRGBO(85, 194, 134, 0.6),
      600: Color.fromRGBO(85, 194, 134, 0.7),
      700: Color.fromRGBO(85, 194, 134, 0.8),
      800: Color.fromRGBO(85, 194, 134, 0.9),
      900: Color.fromRGBO(85, 194, 134, 1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kokedama',
      theme: ThemeData(
        primarySwatch: mycolor,
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
  String searchValue = '';
  TextEditingController textController = TextEditingController();

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
          children: <Widget>[
            Center(
              child: Stack(
                //
                //empilhando elementos
                children: <Widget>[
                  //
                  //card verde
                  Container(
                    width: 1500,
                    height: 235,
                    child: AppBar(
                      backwardsCompatibility: false,
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

                  //
                  //carrossel
                  Container(
                    width: 1500,
                    height: 450,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 142.0,
                          aspectRatio: 16 / 9,
                          enableInfiniteScroll: false,
                          reverse: false,
                          //viewportFraction:
                          //min(((MediaQuery.of(context).size.width) * 0.2) / 400, 0.32),
                          //(((MediaQuery.of(context).size.width) * 0.2) / 300),
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal),
                      items: [1, 2, 3, 4, 5, 6].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width), //400,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Color.fromRGBO(61, 172, 111, 1),
                                    width: 2,
                                  ),
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

                                  //https://pub.dev/packages/carousel_slider
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ), //Container

                  //
                  // talvez ainda possa ser algo
                  Container(), //Container
                ],
              ),
            ),

            // Deamis elementos da página
            // elementos em coluna
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/garden.png',
                  width: 300,
                  height: 150,
                ),
                //
                // primeiro texto
                Text(
                  "Adicione suas plantas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'GlacialIndifference',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 10),

                //
                // segundo texto
                /*
                
                Text(
                  "A partir do momento que você cadastra suas plantinhas no app, \n você será relembrado sobre as necessidades delas :D",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'GlacialIndifference',

                    fontSize: 22,
                  ),
                ),
                */
              ],
            ), //Container
          ],
        ),
      ),
    );
  }
}
