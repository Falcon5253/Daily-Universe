// файл проекта с глобальными переменными и константами, распространённая практика на C++
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:ffi';

late dynamic dailyUser; // указатель на объект пользователя. По идее инициализируется при старте программы, затем присваивается сюда и используется отсюда

// имена переменных класса пользователя, используются для работы с базой sql, т.к. объекты по имени во flutter не вызвать. Необходимо дублировать в файле user.dart
const List userParams = ['userId','name', 'age', 'city','gender','mail','passHash','autoLogin'];
const List sqlDataTypes = ['INTEGER', 'TEXT', 'REAL']; // типы данных для sql, количество фиксированное, повторы не нужны
const List typesGender = ['Не указан', 'Мужской', 'Женский'];
const String dbName = 'my_db.db';
bool firstClassInit = true;
late int deviceRealWidth; //Ширина в пикселях текущего уст-ва
late int deviceRealHeight; //Высота в пикселях текущего уст-ва
late int deviceVirtualWidth;
late int deviceVirtualHeight;
const Color defaultTextColor = Colors.white;
Color? defaultBackgroundColor = Colors.grey[900];
ColorScheme? defaultTopColor = const ColorScheme.light().copyWith( primary: Colors.grey);
Widget? defaultTitle = const Text('Daily universe', style: TextStyle(color: defaultTextColor, fontSize: 28));
const defaultUnderLineTextInputColor = UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),);
final defaultUnderLineDropDownListColor = Container( height: 2, color: Colors.grey,);