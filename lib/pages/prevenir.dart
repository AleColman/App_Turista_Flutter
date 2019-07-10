import 'package:flutter/material.dart';

class Prevenir extends StatefulWidget {
  @override
  _PrevenirState createState() => new _PrevenirState();
 }
class _PrevenirState extends State<Prevenir> {
  static const String routeName = "/prevenir";
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text('Precauciones al comprar'),),
    body: SafeArea(
      child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        ],
                      ),
                    ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                       new Image.asset(
                            'assets/images/factura.jpg', 
                          ),
                        Text(
                          "Solicitar siempre los comprobantes de sus compras y guardarlas para poder reclamar o denunciar.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/pelea.jpg', 
                          ),
                        Text(
                          "Reclamar en el local donde ralizó su compra, si no le solucionan el problema, acuda o comuniquse con Defensa del Consumidor",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/tarjeta.png', 
                          ),
                        Text(
                          "Las compras con tarjetas figuran en la moneda de Paraguay, tenga mucho cuidado con el tipo de cambio que le aplican",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/porcentaje.png', 
                          ),
                        Text(
                          "No pague un porcentaje más en las compras con tarjeta de credito o debito, está prohibido cobrar un recargo en las compras con tarjeta",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                     Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/cambio.png', 
                          ),
                        Text(
                          "Infórmese sobre las cotizaciones del día para realizar compras en tarjeta.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/leer1.png', 
                          ),
                        Text(
                          "Solicite una copia de todos los documentos que firme.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                     Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/leer.png', 
                          ),
                        Text(
                          "Antes de firmar un contrato, lea detenidamente, pregunte todo lo que no entienda y no firme si tiene espacios en blanco.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                     Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/promociones.jpg', 
                          ),
                        Text(
                          "Recuerde que la oferta obliga al proveedor a cumplir con lo ofrecido",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                     Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
     )
   );
  }
}

class SectionCard extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final GestureTapCallback onTap;

  SectionCard(this.leftWidget, this.rightWidget, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 4.0,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: leftWidget,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: rightWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0, color: Colors.blue),
      ),
    );
  }
}