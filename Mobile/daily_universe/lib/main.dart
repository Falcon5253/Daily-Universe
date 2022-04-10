import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(title: const Text('Checklists'),),
          body: const SizedBox(
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
    var widgetsList = [const MyCheckbox(), const MyButton()];
    return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: widgetsList,
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

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () {

      },
      child: Wrap(
        children: const <Widget>[
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