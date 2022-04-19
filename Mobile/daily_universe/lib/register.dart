// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:daily_universe/users.dart';
import 'package:flutter/material.dart';
import 'defines.dart' as d;
import 'package:crypto/crypto.dart';
import 'dart:convert' show utf8;

class Registration extends StatefulWidget {


  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: d.defaultTextColor);
  final formKey = GlobalKey<FormState>();
  String gender = 'Пол';
  String _name=''; int _age=0; int _gender=0; String _mail=''; String _passHash='';
  Widget build(BuildContext context) {
    void hideKeyboard() {
      FocusScope.of(context).unfocus();
    }
    void performLogin() {
      hideKeyboard();
      Navigator.pushReplacementNamed(context, '/main');
    }
    void submit() {
      final form = formKey.currentState;
      if(form!=null) {
        if (form.validate()) {
          _gender = gender == 'М'? 1:gender == 'Ж'?2:0;
         d.AutoLogin=0;
          form.save();
          d.dailyUser = User.reg(_name, _age, _gender, _mail, _passHash);
          d.dailyUser.updateConfigValue(d.localConfigs[0], 0,);
          performLogin();
        }
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: d.defaultBackgroundColor,
      appBar: AppBar(
        title: d.defaultTitle,
        centerTitle: true,
      ),
        body: Center(
        child: Form(
        key: formKey,
            child:  Column(
              children: <Widget>[
                 Container(
                  child:  TextFormField( //mail
                    onSaved: (val) {
                      _mail = val!;
                      //d.dailyUser.mail = val;
                      //d.dailyUser.updateDataBaseValue('mail', d.dailyUser.mail);
                      },
                    validator: (val) {
                      if(val!=null && val!='') {
                        return !val.contains("@") ? 'Not a valid email.' : null;
                      }
                      return 'Empty email field';
                    },
                    decoration:  InputDecoration(labelText: "Почта",
                    labelStyle: _sizeTextWhite,
                    enabledBorder: d.defaultUnderLineTextInputColor,

                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: _sizeTextWhite,
                  ),
                  width: 400.0,
                ),
                 Container(
                  child: TextFormField( //pass
                    onSaved: (val) {
                      if(val!=null) {
                        _passHash = sha512.convert(utf8.encode(val)).toString();
                        //d.dailyUser.updateDataBaseValue('passHash', d.dailyUser.passHash);
                      }
                      },
                    validator: (val) {
                      if(val!=null && val!='') {
                        return null;
                      }
                      return 'Empty password field';
                    },
                    decoration: InputDecoration(labelText: "Пароль", labelStyle: _sizeTextWhite, enabledBorder: d.defaultUnderLineTextInputColor,),
                    obscureText: true,
                    style: _sizeTextWhite,
                  ),
                  width: 400.0,
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Container(
                  child: TextFormField( //name
                    onSaved: (val) {
                      if(val!=null) {
                        _name = val;
                        //d.dailyUser.updateDataBaseValue('name', d.dailyUser.name);
                      }
                    },
                    validator: (val) {
                      if(val!=null && val!='') {
                        return null;
                      }
                      return 'Empty name field';
                    },
                    decoration: InputDecoration(labelText: "Имя", labelStyle: _sizeTextWhite, enabledBorder: d.defaultUnderLineTextInputColor,),
                  //  obscureText: true,
                    style: _sizeTextWhite,
                  ),
                  width: 400.0,
                  padding: EdgeInsets.only(top: 10.0),
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Container(
                     padding: EdgeInsets.only(left: 5.0),
                     child:  TextFormField(//age
                         onSaved: (val) {
                           if(val!=null) {
                             _age = int.parse(val);
                            // d.dailyUser.updateDataBaseValue(
                                // 'age', d.dailyUser.age);
                           }
              },
                   validator: (val) {
                     if(val!=null && val!='') {
                       return null;
                     }
                     return 'Empty age field';
                   },
                decoration:  InputDecoration(labelText: "Возраст",
                  labelStyle: _sizeTextWhite,
                  enabledBorder: d.defaultUnderLineTextInputColor,

                ),
                keyboardType: TextInputType.number,
                style: _sizeTextWhite,
              ),
              width: 150.0,
            ),
                       Container(
                         padding: EdgeInsets.only(top: 40.0),
                         child:  DropdownButton<String>(
                           style: const TextStyle(color: d.defaultTextColor),
                           items: <String>['Пол','М', 'Ж'].map((String value) {
                             return DropdownMenuItem<String>(
                               value: value,
                               child: Text(value),
                             );
                           }).toList(),
                           dropdownColor: Colors.grey,
                           value: gender,
                           onChanged: (String? newValue) {
                             setState((){
                               if(newValue!=null) {
                                 gender = newValue;
                               }
                             });
                           },
                           underline: d.defaultUnderLineDropDownListColor,
                         ),
                         width: 150.0,
                       ),
                         ]),
                 Padding(
                  padding:  EdgeInsets.only(top: 25.0),
                  child:  MaterialButton(
                    color: Theme
                        .of(context)
                        .colorScheme.primary,
                    height: 50.0,
                    minWidth: 150.0,
                    onPressed: submit,
                    child:  Text(
                      "Регистрация",
                      style: _sizeTextWhite,
                    ),
                  ),
                )
              ],
            )
        )
        ),
      );
  }
}

