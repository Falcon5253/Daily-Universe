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

  List<Widget> checkRow = [];
  
  @override
  Widget build(BuildContext context) {
    checkRow = [
      Container(
        child: Row(children: [
            Expanded(
              child: Column(children: [
                Container(
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? value)=> setState(() => {})
                  ),
                  color: Colors.blue,
                  padding: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                ), 
              ]),
              flex: 1,
            ),
            Expanded(
              child: Column(children: const [
                    Text('Checkbox1', textAlign: TextAlign.start),
              ]),
              flex: 15,
            ),
            Expanded(
              child: Column(children: [
                Container(child: IconButton(
                  icon: const Icon(Icons.highlight_remove),
                  onPressed: () {  },),
                  color: Colors.red,
                  margin: const EdgeInsets.only(top:5, bottom: 5),
                ),
              ]),
              flex: 1,
            )
          ],),
          color: Colors.grey,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        )
      ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _map.addEntries([MapEntry('Checkbox #${++_count}', false)])),
      ),
      body: SingleChildScrollView(child: Column(children: checkRow)),

    );
  }  
}