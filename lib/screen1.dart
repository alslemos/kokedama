import 'package:flutter/material.dart';
import 'package:kokedama/telas/Add.dart';
import 'telas/Home.dart';
import 'telas/Myplants.dart';
import 'telas/Tips.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'screen1',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color.fromRGBO(248, 248, 248, 1),
      ),
      home: const screen1(title: 'kokedama'),
      
      debugShowCheckedModeBanner: false,
    );
  }
}

class screen1 extends StatefulWidget {
  const screen1({super.key, required this.title});
  final String title;
  @override
  State<screen1> createState() => _screen1();
}

class _screen1 extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

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
        decoration: BoxDecoration(
         // sem decoração pois mistério
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
                color: Colors.black, 
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
                side: const BorderSide(width: 0.5, color: Colors.green,) // desncessário, mas gostei
              ),

              child: const Text(' Fazer Login ', textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontFamily: 'Open Sans',
                //fontWeight: FontWeight.bold,
                color: Colors.black, 
                fontSize: 20),
            ),
              onPressed: () {}, // ainda sem nenhuma função
              
            ),
            
            // espaço
            SizedBox(height: 10),

            // gesture detector
            GestureDetector(
              onTap: () {
               //Navigator.pushNamed(context, "myRoute");
              },

              child: const Text(
              'Texto genérico',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(fontFamily: 'Open Sans',
                color: Colors.black, 
                fontSize: 18),
            ),),


          ],
        ),
      ),     
    );
  }
}