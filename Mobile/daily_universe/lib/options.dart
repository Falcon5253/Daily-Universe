import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'users.dart';
import 'defines.dart' as d;
//import 'package:url_launcher/url_launcher.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  //double _sliderValue = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: d.defaultBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: d.defaultTextColor),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacementNamed(context, d.navMain);
            },
          ),
          title: d.defaultTitle,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/48)),
            Icon(CupertinoIcons.gear, color: d.defaultTextColor, size: 72),
            Text('Настройки', style: TextStyle(color: d.defaultTextColor, fontSize: 44),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/24)),
            Text('Звук уведомлений', style: TextStyle(color: d.defaultTextColor, fontSize: 24),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/40)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              SizedBox(
                width: d.deviceVirtualWidth/4,
                height: d.deviceVirtualHeight/16,
                child: ElevatedButton(onPressed: () {
                  setState((){
                    d.isSound = true;});
                }, child: Text('Вкл.', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
              ),
              Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
              SizedBox(
                width: d.deviceVirtualWidth/4,
                height: d.deviceVirtualHeight/16,
                child: ElevatedButton(onPressed: () {
                  setState((){
                  d.isSound = false;});
                }, child: Text('Выкл.', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
              ),
            ]),
      Slider(
      value: d.appVolume,
      onChanged: (v){
        setState(() {
          d.appVolume = v;
        });
      },
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/24)),
            Text('Тема приложения', style: TextStyle(color: d.defaultTextColor, fontSize: 24),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/40)),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  SizedBox(
                    width: d.deviceVirtualWidth/4,
                    height: d.deviceVirtualHeight/16,
                    child: ElevatedButton(onPressed: () {
                      setState((){
                        d.isDarkTheme = false;});
                        d.updateOptionsTheme();
                        d.dailyUser.updateConfigValue(d.localConfigs[2], 1);
                      Navigator.pushReplacementNamed(context, d.navOptions);
                    }, child: Text('Светлая', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
                  ),
                  Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
                  SizedBox(
                    width: d.deviceVirtualWidth/4,
                    height: d.deviceVirtualHeight/16,
                    child: ElevatedButton(onPressed: () {
                      setState((){
                      d.isDarkTheme = true;});
                      d.updateOptionsTheme();
                      d.dailyUser.updateConfigValue(d.localConfigs[2], 0);
                      Navigator.pushReplacementNamed(context, d.navOptions);
                    }, child: Text('Темная', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
                  ),
                ]),
            Padding(padding: EdgeInsets.only(top: d.deviceVirtualHeight/24)),
            Text('Автологин', style: TextStyle(color: d.defaultTextColor, fontSize: 24),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceVirtualWidth/4,
              height: d.deviceVirtualHeight/16,
              child: ElevatedButton(onPressed: () {
                setState((){
                d.AutoLogin = d.AutoLogin>0? 0:1;});
                d.dailyUser.updateConfigValue(d.localConfigs[1], d.AutoLogin,);
              }, child: Text(d.AutoLogin>0?'Выкл.':'Вкл.', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
          ],
        )
        )
    );
  }
}

