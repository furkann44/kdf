import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailLoginPage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => new _MailLoginPageState();
}

class _MailLoginPageState extends State<MailLoginPage>{

  String _email;
  String _password;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('E-mail Girişi'),
      ),
      body: new Container(
        child: new Form(
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Şifre'),
              )
            ],
          )
        ),
      ),
    );
  }
}