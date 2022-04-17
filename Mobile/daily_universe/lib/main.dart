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
  final Map<int, List<String>> _map = {};
  int _count = 0;
  List<Widget> checkRow = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _map.addEntries([MapEntry(++_count, ["false", "text $_count"])])),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: _map.keys
                    .map(
                      (key) => CheckField(key, _map),
                    ).toList(),
                  ),
          )
        ],
      ),
    );
  }
}

class CheckField extends StatefulWidget {
  int id;
  Map<int, List<String>> _map = {};
  CheckField(this.id, this._map, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CheckField> createState() => _CheckFieldState(id, _map);
}

class _CheckFieldState extends State<CheckField> {
  int id;
  Map<int, List<String>> _map = {};
  _CheckFieldState(this.id, this._map,);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        bool newValue = _map[id]![0] == "true";
        _map[id]![1] = newValue.toString();
        print("Container number $id was tapped");
      },
      child: Container(
              margin: const EdgeInsets.only(top: 10),
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
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Checkbox(value: _map[id]![0] == "true", onChanged: (value) => setState(() {
                    bool newValue = !value!;
                    _map[id]![0] = newValue.toString();
                    print(id);
                    print(_map[id]![1]);
                    print(value);
                  })),
                  SizedBox(
                    child: Text(_map[id]![1].toString()),
                    width: 100,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(_map[id]![0].toString())
                  )
                ],
              ),
            )
    );
  }
}

