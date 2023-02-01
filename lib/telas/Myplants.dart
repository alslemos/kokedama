import 'package:flutter/material.dart';
import 'package:kokedama/screen1.dart';

import 'Add.dart';
import 'Home.dart';
import 'Tips.dart';

void main() {
  runApp(const Myplants());
}

class Myplants extends StatelessWidget {
  const Myplants({super.key});

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(extendBody: true,

      // botão central
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Add()),
                );},
        child: const Icon(Icons.add_outlined),
        ),

       bottomNavigationBar: BottomAppBar(
       shape: const CircularNotchedRectangle(),
       color: Colors.white,
       child: IconTheme(
        data: IconThemeData(color: Colors.black),
        child: Padding(padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home_outlined), onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home()),
                );}), 
            IconButton(icon: Icon(Icons.explore_outlined), onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Tips()),
                );}),            
            const SizedBox(width: 24),
            IconButton(icon: Icon(Icons.storefront_outlined), onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Myplants()),
                );}),
            IconButton(icon: Icon(Icons.engineering_outlined), onPressed: (){ Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Tips()), // pensar
                );}),         
          ],
        ),),
       ),
      ),
      body: Container(
        width: double.infinity,
        
        // imagem de fundo e centralização
         decoration: BoxDecoration(
        
        ),
        
        //coluna para elementos 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // texto título
            const Text(
              'MyPlants',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontFamily: 'GlacialIndifference',
                fontWeight: FontWeight.bold,
                color: Colors.white, 
                fontSize: 45),
            ),

            // espaço
           const SizedBox(height: 240),

            // botão para entrar na aplicação
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                
                primary: Colors.green,
                onSurface: Colors.green,
                elevation: 5,
                shadowColor: Colors.grey,
                shape: StadiumBorder(),
                side: const BorderSide(width: 0.5, color: Color.fromRGBO(85, 194, 134, 1),) // desncessário, mas gostei
              ),

              child: const Text(' Fazer Login ', textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontFamily: 'Open Sans',
                //fontWeight: FontWeight.bold,
                color: Colors.white, 
                fontSize: 20),
            ),
              onPressed: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );}, // ainda sem nenhuma função
              
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

              style: TextStyle(fontFamily: 'Open Sans',
                color: Colors.white, 
                fontSize: 18),
            ),),

          ],
        ),
      ),
    );
  }
}
