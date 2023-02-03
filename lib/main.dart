import 'package:flutter/material.dart';
import 'package:kokedama/screen1.dart';
import 'package:kokedama/telas/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kokedama',
      theme: ThemeData(
        primarySwatch: Colors.green
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        
        // imagem de fundo e centralização
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            opacity: 0.85,
          ),
        ),
        
        //coluna para elementos 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // texto título
            const Text(
              'Kokedama',
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
                primary: Color.fromRGBO(85, 194, 134,1),
                onSurface: Color.fromRGBO(85, 194, 134,1),
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
                  MaterialPageRoute(builder: (context) => Home()),
                );}, // ainda sem nenhuma função
              
            ),
            
            // espaço
            SizedBox(height: 10),

            // gesture detector
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()),
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
