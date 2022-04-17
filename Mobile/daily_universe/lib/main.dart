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
    checkRow = [const CheckField()];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _map.addEntries([MapEntry('Checkbox #${++_count}', false)])),
      ),
      body: SingleChildScrollView(child: Column(children: checkRow)),

    );
  }  
}

class CheckField extends StatefulWidget {
  const CheckField({Key? key}) : super(key: key);

  @override
  State<CheckField> createState() => _CheckFieldState();
}

class _CheckFieldState extends State<CheckField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      width: MediaQuery.of(context).size.width - 20,
      height: 80,
      decoration: BoxDecoration(
      color: Colors.green,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: const [
          SizedBox(
            child: Text("Hi"),
            width: 100,
          ),
          SizedBox(
            width: 100,
            child: Text("Huy")
          )
        ],
      ),
    );
  }
}