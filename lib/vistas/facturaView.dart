import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto/servicios/facade/modelo/CarritoWS.dart';
import 'package:auto/servicios/utiles/Utilidades.dart';
import 'package:auto/vistas/MenuBarP.dart';


void main() => runApp(MaterialApp(
  home: facturaView(),
));

class FacturaView extends StatefulWidget {
  @override
  _FacturaViewState createState() => _FacturaViewState();
}

class _FacturaViewState extends State<FacturaView> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  double subtotal = 0.0;
  double iva = 0.0;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    _listar();
    _sumar();
  }

  Future<List<CarritoWS>> _listar() async {
    double total = 0.0;
    double subTotal = 0.0;
    double iva = 0.0;
    List<CarritoWS> lista = [];
    Utilidades u = new Utilidades();
    String datos = await u.getCarrito();
    Map<dynamic, dynamic> mapa = jsonDecode(datos);
    //log(mapa.toString());
    for (Map<dynamic, dynamic> v in mapa.values) {
      CarritoWS c = CarritoWS.fromMap(v);
      //log("ssss"+CarritoWS.fromMap(v).toString());
      lista.add(c);
      total += c.pt;
      subTotal = c.ptc;
      iva = c.iva;
    }
    this.total = total;
    this.subtotal = subTotal;
    this.iva = iva;
    return lista;
  }

  void _sumar() async {
    await _listar();
    setState(() {
      subtotal = subtotal;
      iva = iva;
      total=subtotal+iva;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class facturaView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent,Colors.indigoAccent]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "¡FACTURA GENERADA CON EXITO!",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )
          ),

          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,

            child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/home');
                },

                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.blueAccent,Colors.indigoAccent]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text("Volver",
                      style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
