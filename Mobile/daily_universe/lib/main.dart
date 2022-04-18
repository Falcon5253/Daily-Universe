import 'checkboxes.dart';
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
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => checkboxesList.addEntries([MapEntry(++counter, CheckField(counter, false))])),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          checkboxesList.remove(counter--);
                        }); 
                      },
                      child: Container( margin: EdgeInsets.only(left: 160, top: 30), width: 200, height: 40, child: Text("Удалить"))
                    )
                  )
                )
              ] + checkboxesList.values.toList()
            )
          )
        ]
      ),
      
    );
  }
}