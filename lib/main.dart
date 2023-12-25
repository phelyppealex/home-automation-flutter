import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String baseUrl = 'http://192.168.148.161';

  void sendCommand(String route) async {
    String uri = '$baseUrl$route';
    final response = await http.get(Uri.parse(uri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Automação Residencial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                sendCommand('/ligar'); // Enviar comando para ligar o LED
              },
              child: Text('Ligar luz'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendCommand('/desligar'); // Enviar comando para desligar o LED
              },
              child: Text('Apagar luz'),
            ),
          ],
        ),
      ),
    );
  }
}
