import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  
  MyHomePage({
    super.key
  });

  final String baseUrl = 'http://192.168.100.108';

  void sendCommand(String route) async {
    String uri = '$baseUrl$route';
    await http.get(Uri.parse(uri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Automação Residencial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              
            ),
            ElevatedButton(
              onPressed: () {
                sendCommand('/ligar'); // Enviar comando para ligar o LED
              },
              child: const Text('Ligar luz'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendCommand('/desligar'); // Enviar comando para desligar o LED
              },
              child: const Text('Apagar luz'),
            ),
          ],
        ),
      ),
    );
  }
}