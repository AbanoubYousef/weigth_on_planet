import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homestate();
  }
}

class homestate extends State<Home> {

  final TextEditingController _weightcontroller = new TextEditingController();
  int radiovalue = 0;
  double finalresult= 0.0;
  void handleradiovaluechange(int value) {
    setState(() {
      radiovalue = value;
      switch(radiovalue)
      {
        case 0:
          finalresult=calculate(_weightcontroller.text,0.06);
          break;
        case 1:
          finalresult=calculate(_weightcontroller.text,0.38);
          break;
        case 2:
          finalresult=calculate(_weightcontroller.text,0.91);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(" weight on planet"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              width: 150.0,
              height: 150.0,
            ),
            new Container(
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: " your weight on earth",
                      hintText: " in pounds",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                          value: 0,
                          groupValue: radiovalue,
                          onChanged: handleradiovaluechange),
                      new Text("Ploto "),
                      new Radio(
                          value: 1,
                          groupValue: radiovalue,
                          onChanged: handleradiovaluechange),
                      new Text("Mars "),
                      new Radio(
                          value: 2,
                          groupValue: radiovalue,
                          onChanged: handleradiovaluechange),
                      new Text("Venus "),
                    ],
                  ),
                new Padding(padding: EdgeInsets.all(9.7)),
                  new Text(
                    _weightcontroller.text.isEmpty?"please enter weight":" $finalresult ",
                    style: new TextStyle(fontSize: 20.0),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculate(String weight, double d) {
    if(int.parse(weight).toString().isNotEmpty&&int.parse(weight)>0)
      {
        return int.parse(weight)*d;
      }
      else
        {
          return int.parse(weight)*0.38;
        }
  }
}
