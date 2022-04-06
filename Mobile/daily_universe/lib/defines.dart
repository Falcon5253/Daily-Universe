// файл проекта с глобальными переменными и константами, распространённая практика на C++
import 'package:sqflite/sqflite.dart';
import 'dart:ffi';

late dynamic dailyUser; // указатель на объект пользователя. По идее инициализируется при старте программы, затем присваивается сюда и используется отсюда
//late Database dataBase; // открытый объект SQL базы данных

// имена переменных класса пользователя, используются для работы с базой sql, т.к. объекты по имени во flutter не вызвать. Необходимо дублировать в файле user.dart
const List userParams = ['userId','name', 'age', 'city', 'home'];
const List sqlDataTypes = ['INTEGER', 'TEXT', 'REAL']; // типы данных для sql, количество фиксированное, повторы не нужны
const String dbName = 'my_db.db';
bool firstClassInit = true;