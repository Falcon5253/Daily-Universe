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
                      (key) => CheckField(key, _map[key]![0] == "true", _map[key]![1]),
                    ).toList(),
                  ),
          )
        ],
      ),
    );
  }
}

// body: ListView(
//   children: _map.keys
//       .map(
//         (key) => CheckboxListTile(
//           value: _map[key],
//           onChanged: (value) => setState(() => _map[key] = value!),
//           subtitle: Text(key),
//         ),
//       )
//       .toList(),
// ),

// ignore: must_be_immutable
class CheckField extends StatefulWidget {
  int id = 0;
  bool value = false;
  String text = "";
  CheckField(this.id, this.value, this.text, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CheckField> createState() => _CheckFieldState(id, value, text);
}

class _CheckFieldState extends State<CheckField> {
  int id = 0;
  bool value = false;
  String text = "";
  _CheckFieldState(this.id, this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { print("Container number $id was tapped"); },
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
                  Checkbox(value: value, onChanged: onChange),
                  SizedBox(
                    child: Text(text),
                    width: 100,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(value.toString())
                  )
                ],
              ),
            )
    );
  }
}

