// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:daily_universe/users.dart';
import 'package:flutter/material.dart';
import 'defines.dart' as d;
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert' show utf8;

class Login extends StatefulWidget {


  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _sizeTextWhite = TextStyle(fontSize: 20.0, color: d.defaultTextColor);
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String currentMail = '';
  int currentId = 0;
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }
    void checkMail(val) async
    {
      final userDb = await openDatabase(d.dbName);
      var data = await userDb.rawQuery('SELECT mail from users');
      for (Map temp in data)
      {
        String _mail = temp.values.elementAt(0);
        if (_mail.compareTo(val)==0)
        {currentMail = val; return;}
      }
      currentMail = '-1';
    }
    void hideKeyboard() {
      FocusScope.of(context).unfocus();
    }
    void performLogin() {
      hideKeyboard();
      Navigator.pushReplacementNamed(context, '/main');
    }
    void resultLogin() async
    {
      d.dailyUser = null;
      d.dailyUser = User(currentId);
      while(d.dailyUser.name=='')
        {
          await Future.delayed(Duration(milliseconds: 10));
        }
      d.AutoLogin = isChecked?currentId:0;
      d.dailyUser.updateConfigValue(d.localConfigs[1], d.AutoLogin);
      performLogin();
    }
    void checkPass(val) async{
      String _passHash = sha512.convert(utf8.encode(val)).toString();
      while(currentMail.compareTo('')==0 && currentMail.compareTo('-1')!=0)
        {
          await Future.delayed(Duration(milliseconds: 10));
        }
      if (currentMail.compareTo('-1')==0)
        {
          currentMail = '';
          return;
        }
      final userDb = await openDatabase(d.dbName);
      var data = await userDb.rawQuery('SELECT passHash, userId from users WHERE mail = \'$currentMail\'');
      for (Map temp in data)
      {
        String _pass = temp.values.elementAt(0);
        if (_pass.compareTo(_passHash)==0)
        {currentId = temp.values.elementAt(1); resultLogin();return;}
      }
     // currentId = -1;
    }
    void submit() async{
      final form = formKey.currentState;
      if(form!=null) {
        if (form.validate()) {
          //while(currentMail.compareTo('')==0 && currentMail.compareTo('-1')!=0 && currentId==0)
         // {
         //   await Future.delayed(Duration(milliseconds: 10));
         // }
          //if(currentId!=-1&&currentMail.compareTo('-1')!=0) {
        //    d.dailyUser = User(currentId);
           // print(currentId);
           // while(d.dailyUser == null && d.dailyUser.name == '')
         //     {
          //      await Future.delayed(Duration(milliseconds: 10));
         //     }
        //    d.AutoLogin = currentId;
        //    form.save();
         //   performLogin();
         // }
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
                        },
                        validator: (val) {
                          if(val!=null && val!='') {
                           checkMail(val);
                             // res.then((value) {
                               // return value ? null : 'Такой почты нет';
                             // });
                            return null;
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
                          }
                        },
                        validator: (val) {
                          if(val!=null && val!='') {
                            checkPass(val);
                            return 'Неправильная почта или пароль';
                            //if(true)//sha512.convert(utf8.encode(val)).toString()==d.dailyUser.passHash)
                           // {
                           //   return null;
                           // }
                           // else {return 'Пароли не совпадают';}
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


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                          Padding(padding: EdgeInsets.only(left:5)
                          ,child: Text('Запомнить меня?', style: TextStyle(color: d.defaultTextColor, fontSize: 14),textAlign: TextAlign.left,),),
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
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
                          "Войти",
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

