import 'checkboxes.dart';
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => map.addEntries([MapEntry(++count, ["false", "text $count"])])),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: map.keys.map( (key) => const CheckField()).toList()
            )
          )
        ]
      )
    );
  }
}