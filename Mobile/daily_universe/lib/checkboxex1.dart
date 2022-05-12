import 'checkboxes2.dart';
import 'package:flutter/material.dart';



class MainCB extends StatelessWidget {
  const MainCB({Key? key}) : super(key: key);

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
          onPressed: () => setState(() => addCheckbox(++counter, false))
      ),
      body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column (
                    children: checkboxesList.values.toList()
                )
            )
          ]
      ),
    );
  }
}