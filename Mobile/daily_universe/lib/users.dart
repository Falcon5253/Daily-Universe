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
  Если удаляете или переименовываете переменные, то рекомендуется пересоздать базу данных функцией rebuildDataBase.

  На данный момент если количество переменных класса меньше чем ячеек в созданной таблице, то в таблицу добавляется новая ячейка.
  Если ячеек в таблице больше, чем переменных класса, то таблица из бд удаляется и приложение выключается. Причина этого то, что в sqllite
  нельзя нормально удалять колонки из таблиц, можно только создать новую без этой колонки. Перезапускаете приложение и всё работает.

   Принцип работы с файлами: копируете функцию и зависимости import 'users.dart'; import 'defines.dart' as d;
   После этого вызываете функцию из какого-нибудь виджета и получаете объект класса с которым можно взаимодействовать.

    void _AddClass(){
    d.dailyUser = User();
    print(d.dailyUser.age);
    //d.dailyUser.updateDataBaseValue('age', 40); //установить значение age пользователя в базе данных на 40, имена берутся из переменной d.userParams
    //d.dailyUser.updateDataBaseValue('name', 'федор'); // установить значение name на федор, необходимо передавать тип String
    //d.dailyUser.rebuildDataBase(); //очистить базу данных полностью, применяется если меняли переменные класса и всё сломалось.
    d.dailyUser.name = 'вася' // изменить переменную имя на вася, в базу данных сохранять нужно отдельно
    }

    Пример оптимального обновления переменных с минимумом усилий:
    {
    String newName = 'федор';
    int newAge = 30;
    d.dailyUser.age = newAge; //ИЛИ d.dailyUser.age = 30;
    d.dailyUser.updateDataBaseValue('age', d.dailyUser.age); //ИЛИ d.dailyUser.updateDataBaseValue(d.userParams[2], d.dailyUser.age);

    d.dailyUser.name = newName; //ИЛИ d.dailyUser.name = 'федор';
    d.dailyUser.updateDataBaseValue('name', d.dailyUser.name); //ИЛИ d.dailyUser.updateDataBaseValue(d.userParams[1], d.dailyUser.name);
    }


   */

  //сюда добавлять переменные. Поддерживаются только int, double и String.
  int userId = 1; // на данный момент константа, при желании можно переделать
  String name = '';
  int age = 20;
  String city = '';
  int sex = 0; //0-не указан, 1-м, 2-ж
  String mail = '';
  String passHash = '';
  //...................................................................


  //сюда можно добавлять любые переменные, которые не работают с базой данных, упоминать их при этом нужно только здесь (не считая ваших функций конечно)
  final userDb = openDatabase(d.dbName); // переменная статичная и не сохраняется в базе данных
  //......................................................................

  User() //инициализация пользователя
  {
    userDb.then((db) => parseUserData(db));
  }
  parseUserData(Database db)
  {
    List classParams = [userId,name,age,city,sex,mail,passHash];
    if(classParams.length!=d.userParams.length) { print('classParams.length!=d.userParams.length');exit(1);}
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
      temp.then((data) => parseUserDataCont(classParams, data));
  }
  String getSqlType(param)
  {
    switch(param.runtimeType){
      case int:
        return d.sqlDataTypes[0];
      case String:
        return d.sqlDataTypes[1];
      case double:
        return d.sqlDataTypes[2];
      default:
        print('not find type sql ${param.runtimeType} = $param');
        exit(1);
    }
  }
  void parseUserDataCont(List classParams, List data)
  {
    Map userD = {};
    if(data.isNotEmpty) {userD = data[0];}
    else {return;}
    if(userD.length != classParams.length) //|| data.isEmpty)
    {
      int offset = (classParams.length - userD.length);
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
        //String updateSqlParamStr = 'UPDATE users SET ' + d.userParams[i].toString() + ' = ' + classParams[i].toString() + ' WHERE userId = 1';
          String updateSqlParamStr = 'UPDATE users SET ${d.userParams[i].toString()} = ${classParams[i].toString()} WHERE userId = 1';
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
    sex = classParams[variable++];
    mail = classParams[variable++];
    passHash = classParams[variable++];
    //....................................................
  }
  void updateDataBaseValue(String name, param)
  {
    if(param.runtimeType!=String) {
      //String result = "UPDATE users SET " + name + ' = ' + param.toString();
      String result = "UPDATE users SET $name = ${param.toString()}";
      userDb.then((db) => db.execute(result));
    }
    else
      {updateDataBaseString(name, param);}
  }
  void updateDataBaseString(String name, param)
  {
    String result = "UPDATE users SET $name = \'${param.toString()}\'";
    userDb.then((db) => db.execute(result));
  }
  Future<void> fixColumn(int offset, classParams) async
  {
    Database db = await userDb;
    int userDataLen = d.userParams.length;
    if (offset < 0) {
      /*for (int i = userDataLen; i < userDataLen - offset; i++) { //DROP COLUMN не работает в sqlflite
        await db.execute('ALTER TABLE users DROP COLUMN ${d.userParams[i-1]}');
      }*/
      print('В базе данных найдена лишняя переменная, необходимо пересоздать бд. Выполняю');
      rebuildDataBase();
    }
    else if (offset>0)
        {
          for(int i = userDataLen-offset; i<userDataLen;i++)
          {
            String curParamName = d.userParams[i];
            dynamic curObjectParam = classParams[i];
            String sqlCurrentType = getSqlType(curObjectParam);
            await db.execute('ALTER TABLE users ADD COLUMN $curParamName $sqlCurrentType');
          }
        }
    return;
  }
  void rebuildDataBase()
  {
    String result = 'DROP TABLE users;';
    userDb.then((db) {
      final temp = db.execute(result);
      temp.whenComplete(() => exit(0));
    });
  }
  /*testUpdateAll(String name,variable ,param) //не работает. Условный d.users.age, передаваемый в качестве variable является копией данных, а не ссылкой или указателем
  {
    updateDataBaseString(name, param);
    variable = param;
  }*/
}