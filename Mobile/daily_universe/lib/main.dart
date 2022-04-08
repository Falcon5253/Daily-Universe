import 'package:flutter/material.dart';
import 'users.dart';
import 'defines.dart' as d;

// В этом примере у счётчика нестандартное поведение. При нажатии на кнопку он показывает переменную age класса user, после чего увеличивает её на единицу в объекте и в скл базе

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter = d.dailyUser.age;
      d.dailyUser.age ++;
      d.dailyUser.updateDataBaseValue('age', d.dailyUser.age);
      //d.dailyUser.rebuildDataBase();
    });
  }

  void _AddClass(){
    if (d.firstClassInit) {
      d.dailyUser = User();
      d.firstClassInit = false;
    }
    //print(d.dailyUser.age);
    //d.dailyUser.updateDataBaseValue('age', 40);
    //d.dailyUser.rebuildDataBase();
  }

  @override
  Widget build(BuildContext context) {
    _AddClass();

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
