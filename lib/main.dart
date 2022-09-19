import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  //void main chama a aplicação, é a classe principal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //topo da arvore, stateless sem estado, filho do runapp
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*essa cor definida como primaria vai servir para para o app inteiro,
      isso acontece pq é herança*/
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, //segue de acordo com o tema do celular
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //filho da myapp stateful - com estado, filha da materialapp
  const MyHomePage({
    super.key, //isso é padrão da widget
    
  });

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //setState é o que com que a tela atualize
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      //setState é o que com que a tela atualize
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Aqui é onde escreve o código do que deve aparecer na tela
    return Scaffold(
      //scaffold é o esqueleto da aplicação
      appBar: AppBar(
        //appBar é a barra superior
        title: const Text('Aplicativo Flutter'),
      ),
      body: Center(
        //center é referente ao texto está centralizado na tela, é filho do scaffold
        child: Column(
          //a column é uma organização que recebe multiplos itens (children), é filho co center
          mainAxisAlignment: MainAxisAlignment.center,
          /*mainAxisAlignment é o alinhamento principal da coluna vertical
          neste caso está alinhado ao centro, com start fica no inicio da tela*/
          children: <Widget>[
            //como é texto é uma constante
            const Text(
              'olá:',

              //style: Theme.of(context).textTheme.displayLarge,se for style tem que tirar o const acima
              //è o que aparece na tela da home
            ),
            //text é a mesma coisa do print, aqui não é constante pois se refere ao contador,eles são filhos da column
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
              //aqui pode mudar o tamanho do texto '
            ),
          ],
        ),
      ),floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      //aqui vai mudar onde o fba vai ficar na tela. 
      //floatingActionButton: Row ra ficar horizontalmente
      //fab é filho da scaffold
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       FloatingActionButton(
       onPressed: () {
          log('oi');
       _decrementCounter();
        },
        tooltip: 'decrement',
        child: const Icon(Icons.remove),
        backgroundColor:Colors.pinkAccent,
       ), 
       FloatingActionButton (
         onPressed: () {
          log('oi');
          //é o que aparece no terminal
          _incrementCounter();
        },
        tooltip: 'Increment',
        //tooltip é como a legenda do botão
        child: const Icon(Icons.add),
        backgroundColor:Colors.green
        //paramudar a cor do botão
        //filho do botão,antes era icons.add
      ),
      ],
      )
       );
  }
 
}