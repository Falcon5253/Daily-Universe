import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

bool isChecked = false;



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
  final Map<String, bool> _map = {};
  int _count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => _map.addEntries([MapEntry('Checkbox #${++_count}', false)])),
      ),
      body: ListView(
        children: _map.keys
            .map(
              (key) => CheckboxListTile(
                value: _map[key],
                onChanged: (value) => setState(() => _map[key] = value!),
                subtitle: Text(key),
              ),
            )
            .toList(),
            
      ),
    );
  }
}
