import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {

  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;

  String _infoText = "Pode Entrar!!";


  void _changePeople(int delta){

  /*o setState avisa para o dart que depois que executar o codigo dentro dele, mude a tela denovo*/
    setState(() {
      _people += delta;

      if(_people < 0){
        _infoText = "Mundo invertido";
      }else if(_people <= 10){
        _infoText = "Pode Entrar!";
      }else{
        _infoText = "Lotado!!!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Centro principal de alinhamento de uma coluna é vertical, portanto alinha os elemento ao centro
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //Centro principal de alinhamento de uma linha é horizontal, portanto alinha os elemento ao centro
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: (){
                      _changePeople(1);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: (){
                      _changePeople(-1);
                    },
                  ),
                ],
              ),
            ),
            Text("$_infoText",
                style: TextStyle(
                    color: Colors.yellow,
                    fontStyle: FontStyle.italic,
                    fontSize: 30))
          ],
        )
      ],
    );
  }
}










