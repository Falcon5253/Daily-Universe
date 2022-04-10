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
  bool isChecked = false;
  void addCheckbox(){

  }

  @override
  Widget build(BuildContext context) {
    var widgetsList = [
      ElevatedButton(
        onPressed: () {
          addCheckbox();
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
      ),
      Checkbox(
        value: isChecked,
        onChanged: (bool? value){
          setState(() {
            isChecked = value!;
          });
        }
      ),
    ];



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
