import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(title: Text('Checklists'),),
          body: SizedBox(
            child: Home()
          )
      )
    );
  }
}

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    var Widgets = [MyCheckbox(), MyButton()];
    return Scaffold(
        body: Container(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: Widgets,
          ),
        )
    );
  }
}



class MyCheckbox extends StatefulWidget{
  const MyCheckbox({Key? key}) : super(key: key);
  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}
class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context){
    return Checkbox(
        value: isChecked,
        onChanged: (bool? value){
          setState(() {
            isChecked = value!;
          });
        }
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);
  @override
  State<MyButton> createState() => _MyButtonState();
}
class _MyButtonState extends State<MyButton> {
  Widget build(BuildContext context){
  return ElevatedButton(
    onPressed: () {

    },
    child: Wrap(
      children: <Widget>[
        Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
        ),
        SizedBox(
          width: 10,

        ),
        Text("Add", style:TextStyle(fontSize:20)),
      ],
    ),

    );
  }
}