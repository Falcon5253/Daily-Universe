// файл проекта с глобальными переменными и константами, распространённая практика на C++
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:ffi';

late dynamic dailyUser; // указатель на объект пользователя. По идее инициализируется при старте программы, затем присваивается сюда и используется отсюда

// имена переменных класса пользователя, используются для работы с базой sql, т.к. объекты по имени во flutter не вызвать. Необходимо дублировать в файле user.dart
const List userParams = ['userId','name', 'age', 'city','gender','mail','passHash'];
const List sqlDataTypes = ['INTEGER', 'TEXT', 'REAL']; // типы данных для sql, количество фиксированное, повторы не нужны
const List typesGender = ['Не указан', 'Мужской', 'Женский'];
const String dbName = 'my_db.db';
List userMails = []; // список почт зарегистрированных пользователей, берётся из скл таблицы при запуске программы
List sqlTables = []; //список таблиц которые созданы в sql базе, нужны для проверок валидности
int lastUserId = 0;
int AutoLogin = 0;
const List localConfigs = ['userId','autoLogin', 'isDarkTheme'];
bool firstClassInit = true;
late int deviceRealWidth; //Ширина в пикселях текущего уст-ва
late int deviceRealHeight; //Высота в пикселях текущего уст-ва
late int deviceVirtualWidth;
late int deviceVirtualHeight;

Color defaultTextColor = Colors.white;
Color? defaultBackgroundColor = Colors.grey[900];
ColorScheme? defaultTopColor = ColorScheme.light().copyWith( primary: Colors.grey);
Widget? defaultTitle = Text('Daily universe', style: TextStyle(color: defaultTextColor, fontSize: 28));
var defaultUnderLineTextInputColor = UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),);
var defaultUnderLineDropDownListColor = Container( height: 2, color: Colors.grey,);


//Переменные для навигации..........
const navStart = '/';
const navLogin = '/log';
const navReg = '/reg';
const navMain = '/main';
const navCalendar = '/main/cal';
const navInstruction = '/main/inst';
const navOptions = '/main/opt';
const navCheckbox = '/main/box';
//Конец переменных для навигации.........

//переменные из настроек.............
double appVolume = 0.5;
bool isSound = true;
bool isDarkTheme = true;

void updateOptionsTheme()
{
  defaultTextColor = isDarkTheme?Colors.white:Colors.black;
  defaultBackgroundColor = isDarkTheme?Colors.grey[900]:Colors.white;
  defaultTitle = Text('Daily universe', style: TextStyle(color: defaultTextColor, fontSize: 28));
  defaultUnderLineTextInputColor = UnderlineInputBorder(borderSide: BorderSide(color: defaultTextColor),);
  defaultUnderLineDropDownListColor = isDarkTheme?Container( height: 2, color: Colors.grey,):Container( height: 2, color: Colors.grey[600],);
}
//Конец переменных из настроек........

