import 'package:flutter/material.dart';
import 'users.dart';
import 'defines.dart' as d;

class Crossroads extends StatelessWidget {
  const Crossroads({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
            Text('Вас зовут: ${d.dailyUser.name},\nваш возраст: ${d.dailyUser.age},\nваш пол: ${d.typesGender[d.dailyUser.gender]},\nваша почта: ${d.dailyUser.mail},\nхеш вашего пароля: ${d.dailyUser.passHash}', style: TextStyle(color: d.defaultTextColor, fontSize: 24),textAlign: TextAlign.left,),
          ],
        )
    );
  }
}

