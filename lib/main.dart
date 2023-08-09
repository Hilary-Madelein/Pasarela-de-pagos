import 'package:auto/vistas/carritoView.dart';
import 'package:auto/vistas/exception/Page404.dart';
import 'package:auto/vistas/menuView.dart';
import 'package:auto/vistas/registroView.dart';
import 'package:auto/vistas/sessionView.dart';
import 'package:auto/vistas/creditCardView.dart';
import 'package:auto/vistas/facturaView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: sessionView(),
      initialRoute: '/home',
      routes:{
        '/home': (context) => sessionView(),
        '/principal': (context)=> menuView(),
        '/registro': (context)=> registroView(),
        '/carrito': (context)=> carreitoView(),
        '/creditCard': (context)=> creditCardView(),
        '/factura': (context)=> facturaView()
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context)=> Page404());
      },
    );
  }
}

