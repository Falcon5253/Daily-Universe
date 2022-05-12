import 'package:flutter/material.dart';
import 'users.dart';
import 'defines.dart' as d;
import 'package:url_launcher/url_launcher.dart';

class Instruction extends StatelessWidget {
  const Instruction({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: d.defaultBackgroundColor,
        appBar: AppBar(
          leading: BackButton(
              color: d.defaultTextColor
          ),
          title: d.defaultTitle,
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/16)),
            Text('Инструкция пользователя', style: TextStyle(color: d.defaultTextColor, fontSize: 44),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                final Uri _url = Uri.parse('https://disk.yandex.ru/i/o0F5OYUeT4RjJw');
                launchUrl(_url);
              }, child: Text('Скачать', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                final Uri _url = Uri.parse('https://traveling-sumac-60c.notion.site/Daily-universe-8fda643f87be4cd7bcfee57cb9d2798d');
                launchUrl(_url);
              }, child: Text('Посмотреть', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/48)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Продолжить', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
          ],
        )
    );
  }
}

