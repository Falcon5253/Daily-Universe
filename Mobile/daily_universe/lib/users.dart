import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'defines.dart' as d;
import 'dart:io';

class User {
  /*
  Для добавления переменных необходимо сделать четыре действия:
  1) добавить переменную список ниже
  2) добавить её в список classParams
  3) в файле defines добавить имя в userParams
  4) в конце функции parseUserDataCont дописать 'переменная' = classParams[variable++];
  Для корректной работы необходимо, чтобы последовательность переменных в пунктах 2 и 3 совпадало
  Когда добавляете новые переменные обязательно делайте это в конец, 
  так база данных сможет создать новые колонки без удаления и повторной установки
  Если удаляете или переименовываете переменные, то рекомендуется пересоздать базу данных функцией rebuildDataBase

   Принцип работы с файлами: копируете функцию и зависимости import 'users.dart'; import 'defines.dart' as d;
   После этого вызываете функцию из какого-нибудь виджета и получаете объект класса с которым можно взаимодействовать.

    void _AddClass(){
    d.dailyUser = User();
    print(d.dailyUser.age);
    //d.dailyUser.updateDataBaseValue('age', 40); //установить значение age пользователя в базе данных на 40, имена берутся из переменной d.userParams
    //d.dailyUser.updateDataBaseString('name', 'федор'); // тоже что предыдущая, но принимает строки
    //d.dailyUser.rebuildDataBase(); //очистить базу данных полностью, применяется если меняли переменные класса и всё сломалось.
    d.dailyUser.name = 'вася' // изменить переменную имя на вася, в базу данных сохранять нужно отдельно
    d.dailyUser.age = 30;//
  }

   */

  //сюда добавлять переменные
  int userId = 1; // на данный момент константа, при желании можно переделать
  String name = 'DefaultName';
  int age = 20;
  String city = 'DefaultCity';
  double home = 3.4;


  dynamic userDb = openDatabase(d.dbName); // переменная статичная и не сохраняется в базе данных
  //

  User() //инициализация пользователя
  {
    //final dbFuture = openDatabase('my_db.db');
    userDb.then((db) => parseUserData(db));
  }
  parseUserData(Database db)
  {
    //d.dataBase = db;
    //userDb = db;
    //print(userDb);
    List classParams = [userId,name,age,city,home];
    if(classParams.length!=d.userParams.length) { print('classParams.length!=d.userParams.length');return;}
    String result = 'CREATE TABLE IF NOT EXISTS users(userId INTEGER PRIMARY KEY,';
    for(var i = 1; i<d.userParams.length;i++) { //в этом цикле создаётся файл сохранения и обновляются колонки
      String curParamName = d.userParams[i];
      dynamic curObjectParam = classParams[i];
      String sqlCurrentType = getSqlType(curObjectParam);
      result += ' ' + curParamName + ' ' + sqlCurrentType + ',';
    }
    result = result.substring(0, result.length-1);
    result += ')';
    db.execute(result);
    db.execute('insert or ignore into users(userId) values (1)');
      final temp = db.rawQuery('SELECT * from users WHERE userId = 1');
      temp.then((data) => parseUserDataCont(classParams, data));//parseUserDataCont(classParams, data));
  }
  getSqlType(param)
  {
    switch(param.runtimeType){
      case int:
        return d.sqlDataTypes[0];
      case String:
        return d.sqlDataTypes[1];
      case double:
        return d.sqlDataTypes[2];
      default:
        print('not find type sql');
        break;
    }
  }
  parseUserDataCont(List classParams, List data)
  {
    //print(data);
    Map userD = {};
    if(data.isNotEmpty) {userD = data[0];}
    else {return;}
    if(userD.length != classParams.length) //|| data.isEmpty)
    {
      //print(userD.length); print(classParams.length);
      int offset = (userD.length - classParams.length).abs();
      fixColumn(offset, classParams);
    }
    for(int i = 0; i<userD.length;i++)
      {
        var param = userD.values.elementAt(i);
        if(param!=null)
        {
        classParams[i] = param;
        }
        if (classParams[i] != param && classParams[i]!=Null && classParams[i].runtimeType!=String) {
        String updateSqlParamStr = 'UPDATE users SET ' + d.userParams[i].toString() + ' = ' + classParams[i].toString() + ' WHERE userId = 1';
        userDb.then((db) => db.execute(updateSqlParamStr));
        }
        if (classParams[i] != param && classParams[i]!=Null && classParams[i].runtimeType==String) {
          String updateSqlParamStr = 'UPDATE users SET ${d.userParams[i].toString()} = \'${classParams[i].toString()}\'';
          userDb.then((db) => db.execute(updateSqlParamStr));
        }
      }
    // червёртое место, где нужно добавлять переменные при обновлении класса (списки по какой-то причине хранят только копии этих переменных)
    int variable = 1;
    name = classParams[variable++];
    age = classParams[variable++];
    city = classParams[variable++];
    home = classParams[variable++];
    //
  }
  updateDataBaseValue(String name, param)
  {
    String result = "UPDATE users SET " + name + ' = ' + param.toString();
    userDb.then((db) => db.execute(result));
  }
  fixColumn(int offset, classParams)
  {
    int userDataLen = d.userParams.length;
    if(offset<=0) {return;}
    for(int i = userDataLen-offset; i<userDataLen;i++)
      {
        String curParamName = d.userParams[i];
        dynamic curObjectParam = classParams[i];
        String sqlCurrentType = getSqlType(curObjectParam);
        String tempString = 'ALTER TABLE users ADD COLUMN '; //добавление столбцов по одной штуке сделано для того, чтобы пользователям сэйв не сносить при добавлении новых переменных. Новые колонки будут добавляться, старые игнорироваться с предупреждением в лог
        tempString = tempString + curParamName + ' ' + sqlCurrentType;
        userDb.then((db) => db.execute(tempString));
      }
  }
  rebuildDataBase()
  {
    String result = 'DROP TABLE users;';
    int temp;
    userDb.then((db) => temp = db.execute(result));
  }
  updateDataBaseString(String name, param)
  {
    String result = "UPDATE users SET $name = \'${param.toString()}\'";
    userDb.then((db) => db.execute(result));
  }
}