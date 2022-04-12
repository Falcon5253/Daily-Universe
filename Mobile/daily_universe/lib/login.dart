// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'defines.dart' as d;
import 'package:crypto/crypto.dart';
import 'dart:convert' show utf8;

class Login extends StatefulWidget {


  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: d.defaultTextColor);
  final formKey = GlobalKey<FormState>();
  String gender = 'М';
  bool isChecked = false;
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
          d.dailyUser.autoLogin = isChecked? 1:0;
          d.dailyUser.updateDataBaseValue('autoLogin', d.dailyUser.autoLogin);
          form.save();
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
                        },
                        validator: (val) {
                          if(val!=null && val!='') {
                            if(val==d.dailyUser.mail)
                              {
                                return null;
                              }
                            else {return 'Такой почты нет';}
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
                            if(sha512.convert(utf8.encode(val)).toString()==d.dailyUser.passHash)
                            {
                              return null;
                            }
                            else {return 'Пароли не совпадают';}
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

