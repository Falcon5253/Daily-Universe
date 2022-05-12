// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'users.dart';
import 'defines.dart' as d;
import 'register.dart';
import 'login.dart';
import 'main_menu.dart';
import 'calendar.dart';
import 'instruction.dart';
import 'options.dart';
import 'checkboxex1.dart';

/*
stless быстрое создание класса с виджетом; initstate быстрое создание функции
primaryColor менять на colorScheme: ColorScheme.light().copyWith( primary: Colors.deepOrangeAccent)
 */

// Если возникли ошибки с таблицей config или users вызовите функцию rebuildDataBase() из файла users.dart

void checkAutoLogin() async{
  final userDb = await openDatabase(d.dbName);
  await userDb.execute('CREATE TABLE IF NOT EXISTS config(userId INTEGER PRIMARY KEY, ${d.localConfigs[1]} INTEGER, ${d.localConfigs[2]} INTEGER)');
  final List temp = await userDb.rawQuery('SELECT * from config WHERE userId = 1');
  if(temp.isNotEmpty){
  Map data = temp[0];
  d.AutoLogin = data.values.elementAt(1)>0? 1:0;
  d.isDarkTheme = data.values.elementAt(2)>0? false:true;
  d.updateOptionsTheme();
  }
  d.sqlTables = (await userDb
      .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
      .map((row) => row['name'] as String)
      .toList(growable: false);
  getLastUserId(userDb);
  checkMails(userDb);
}

void getLastUserId(Database userDb)async{
  if(!d.sqlTables.contains('users'))
    {return;}
  //await userDb.execute('CREATE TABLE IF NOT EXISTS users(userId INTEGER PRIMARY KEY)');
  final List temp = await userDb.rawQuery('SELECT userId from users');
  if(temp.isNotEmpty){
    Map data =  await temp.last;
    d.lastUserId =  await data.values.elementAt(0);
  }
}

void checkMails(Database userDb)async {
    if(!d.sqlTables.contains('users'))
    {return;}
    final List temp = await userDb.rawQuery('SELECT mail from users');
    if (temp.isNotEmpty) {
      for (Map i in temp) {
        d.userMails.add(i.values.elementAt(0));
      }
    }
  }


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: d.defaultTopColor,
    ),
    initialRoute: d.navStart, 
    routes: {
      d.navStart: (context) => MainScreen(),
      d.navLogin: (context) => Login(),
      d.navReg: (context) => Registration(),
      d.navMain: (context) => MainMenu(),
      d.navCalendar: (context) => Calendar(), 
      d.navInstruction: (context) => Instruction(),
      d.navOptions: (context) => Options(),
      d.navCheckbox: (context) => MainCB(),
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
              Navigator.pushNamed(context, d.AutoLogin>0?d.navMain:d.navLogin);
            }, child: Text('Войти в аккаунт', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, d.navReg);
              }, child: Text('Зарегистрироваться', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),

          ],
        )
    );
  }
}
