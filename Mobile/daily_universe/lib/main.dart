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
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _map.addEntries([MapEntry('Checkbox #${++_count}', false)])),
      ),
      body: SingleChildScrollView( child: Row(children: [
        SizedBox(

        child: Column(children: [
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox1'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox2'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox3'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox4'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox5'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox6'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox7'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox8'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox9'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox10'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox11'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox12'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox13'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox14'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox15'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox16'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox17'), controlAffinity: ListTileControlAffinity.leading,),
          CheckboxListTile(value: false, onChanged: (bool? value)=> setState(() => {}), title: const Text('Checkbox18'), controlAffinity: ListTileControlAffinity.leading,),
        ]),
        width: MediaQuery.of(context).size.width * 0.9,
        ),
        SizedBox(
        child: Column(children: [
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
          SizedBox(child: IconButton(icon: Icon(Icons.highlight_remove), onPressed: () {  },), height: 48,),
        ]),
        width: MediaQuery.of(context).size.width * 0.1,
        )
        // Column(
        // children: [
        //   Icon(Icons.delete),
        //   Icon(Icons.delete),
        //   Icon(Icons.delete),
        // ]),
      ],
      ))
    );
  }
}