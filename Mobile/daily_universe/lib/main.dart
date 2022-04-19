// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'users.dart';
import 'defines.dart' as d;
import 'register.dart';
import 'login.dart';
import 'crossroads.dart';

/*
stless быстрое создание класса с виджетом; initstate быстрое создание функции
primaryColor менять на colorScheme: ColorScheme.light().copyWith( primary: Colors.deepOrangeAccent)
 */


//void userClassInit() {
 // if (d.firstClassInit) {
 //   d.dailyUser = User();
    //d.firstClassInit = false;
 // }
//}

void checkAutoLogin() async{
  final userDb = await openDatabase(d.dbName);
  await userDb.execute('CREATE TABLE IF NOT EXISTS config(userId INTEGER PRIMARY KEY, ${d.localConfigs[1]} INTEGER)');
  final List temp = await userDb.rawQuery('SELECT * from config WHERE userId = 1');
  if(temp.isNotEmpty){
  Map data = temp[0];
  d.AutoLogin = data.values.elementAt(1)>0? 1:0;}
  //print(d.isAutoLogin);
  getLastUserId(userDb);
}

void getLastUserId(Database userDb)async{
  await userDb.execute('CREATE TABLE IF NOT EXISTS users(userId INTEGER PRIMARY KEY)');
  final List temp = await userDb.rawQuery('SELECT userId from users');
  if(temp.isNotEmpty){
    Map data =  await temp.last;
    d.lastUserId =  await data.values.elementAt(0);
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: d.defaultTopColor,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/log': (context) => Login(),
      '/reg': (context) => Registration(),
      '/main': (context) => Crossroads(),
    },
  ));

}


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (d.firstClassInit) {
      d.deviceVirtualHeight = MediaQuery.of(context).size.height.round();
      d.deviceVirtualWidth = MediaQuery.of(context).size.width.round();
      d.deviceRealHeight = (MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio).round();
      d.deviceRealWidth = (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round();
      checkAutoLogin();
      //userClassInit();
      d.firstClassInit = false;
      }


    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: d.defaultBackgroundColor,
        appBar: AppBar(
          title: d.defaultTitle,
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/16)),
            Text('Вы хотите авторизироваться?', style: TextStyle(color: d.defaultTextColor, fontSize: 36),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/64)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () async{
                if(d.AutoLogin>0){
                  d.dailyUser = User(d.AutoLogin);
                  while(d.dailyUser.name=='')
                  {
                    await Future.delayed(Duration(milliseconds: 10));
                  }
                }
              Navigator.pushNamed(context, d.AutoLogin>0?'/main':'/log');
            }, child: Text('Войти в аккаунт', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/reg');
              }, child: Text('Зарегистрироваться', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),

          ],
        )
    );
  }
}










// В этом примере у счётчика нестандартное поведение. При нажатии на кнопку он показывает переменную age класса user, после чего увеличивает её на единицу в объекте и в скл базе

/*class MyApp extends StatelessWidget {
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
}*/
