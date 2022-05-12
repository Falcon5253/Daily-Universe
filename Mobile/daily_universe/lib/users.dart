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
  int userId = 0;
  String name = '';
  int age = 0;
  String city = '';
  int gender = 0; //0-не указан, 1-м, 2-ж
  String mail = '';
  String passHash = '';
  //int autoLogin = 0; //1-да
  //...................................................................


  //сюда можно добавлять любые переменные, которые не работают с базой данных, упоминать их при этом нужно только здесь (не считая ваших функций конечно)
  final userDb = openDatabase(d.dbName); // переменная статичная и не сохраняется в базе данных
  //......................................................................

  User(int _id) //инициализация пользователя
  {
    userId = _id;
    userDb.then((db) {
      parseUserData(db);
      //addLocalConfig(db);
    });
  }

  User.reg(String _name, int _age, int _gender, String _mail, String _passHash)
  {
    userId = d.lastUserId +1; d.lastUserId ++;
    name = _name;
    age = _age;
    gender = _gender;
    mail = _mail;
    passHash = _passHash;
    userDb.then((db)=>parseUserData(db));
  }

 // addLocalConfig(Database db) //пока что почти пустой
 // {
 // }
  parseUserData(Database db) async
  {
    List classParams = [userId,name,age,city,gender,mail,passHash];
    if(classParams.length!=d.userParams.length) { print('classParams.length!=d.userParams.length');exit(1);}
    String result = 'CREATE TABLE IF NOT EXISTS users(userId INTEGER PRIMARY KEY,';
    for(var i = 1; i<d.userParams.length;i++) { //в этом цикле создаётся файл сохранения и обновляются колонки
      String curParamName = d.userParams[i];
      dynamic curObjectParam = classParams[i];
      String sqlCurrentType = getSqlType(curObjectParam);
      result += ' $curParamName $sqlCurrentType,';
    }
    result = result.substring(0, result.length-1);
    result += ')';
    await db.execute(result);
    var temp = db.execute('insert or ignore into users(userId) values ($userId)');
    List<Map<String, Object?>> data;
    temp.then((d) async => {
    data = await db.rawQuery('SELECT * from users WHERE userId = $userId'),
    parseUserDataCont(classParams, data)});
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
  void afterFixColumn(List classParams) async
  {
    Database db = await userDb;
    var _data = await db.rawQuery('SELECT * from users WHERE userId = $userId');
    parseUserDataCont(classParams, _data);
  }
  void parseUserDataCont(List classParams, List data) async
  {
    Map userD = {};
    if(data.isNotEmpty) {userD = data[0];}
    else {return;}
    if(userD.length != classParams.length) //|| data.isEmpty)
    {
      int offset = (classParams.length - userD.length);
      final fixResult = fixColumn(offset, classParams);
      fixResult.whenComplete(() => {
        afterFixColumn(classParams)
      });
      return;
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
          String updateSqlParamStr = 'UPDATE users SET ${d.userParams[i].toString()} = ${classParams[i].toString()} WHERE userId = $userId';
        userDb.then((db) => db.execute(updateSqlParamStr));
        }
        if (classParams[i] != param && classParams[i]!=Null && classParams[i].runtimeType==String) {
          String updateSqlParamStr = 'UPDATE users SET ${d.userParams[i].toString()} = \'${classParams[i].toString()}\' WHERE userId = $userId';
          userDb.then((db) => db.execute(updateSqlParamStr));
        }
      }
    // червёртое место, где нужно добавлять переменные при обновлении класса (списки по какой-то причине хранят только копии этих переменных)
    int variable = 1;
    name = classParams[variable++];
    age = classParams[variable++];
    city = classParams[variable++];
    gender = classParams[variable++];
    mail = classParams[variable++];
    passHash = classParams[variable++];
    //....................................................
  }
  void updateDataBaseValue(String name, param, [String? table])
  {
    table = table ?? 'users';
    if(param.runtimeType!=String) {
      String result = "UPDATE $table SET $name = ${param.toString()} WHERE userId = $userId";
      userDb.then((db) => db.execute(result));
    }
    else
      {updateDataBaseString(name, param, table);}
  }
  void updateDataBaseString(String name, param, [String? table])
  {
    table = table ?? 'users';
    String result = "UPDATE $table SET $name = \'${param.toString()}\' WHERE userId = $userId";
    userDb.then((db) => db.execute(result));
  }
  void updateConfigValue(name, param) async
  {
    Database db = await userDb;
    await db.execute('insert or ignore into config(userId) values (1)');
    await db.execute('UPDATE config SET $name = \'${param.toString()}\' WHERE userID = 1');
  }
  Future<int> fixColumn(int offset, classParams) async
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
    return 1;
  }
  void rebuildDataBase()
  {
    String result = 'DROP TABLE users; DROP TABLE config;';
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