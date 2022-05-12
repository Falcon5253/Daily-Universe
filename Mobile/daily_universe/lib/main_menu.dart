import 'package:flutter/material.dart';
import 'users.dart';
import 'defines.dart' as d;



class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d.defaultBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: d.defaultTextColor),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, d.navStart);
            },
        ),
        title: d.defaultTitle,
        centerTitle: true,
      ),
      body:   Center(
        child: Column(
          children: [
            // Row(
            //   children: [Text("1")],
            // ),
            // Row(
            //   children: [Text("2")],
            // ),
            // Row(
            //   children: [Text("3")],
            // )
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/32)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, d.navCalendar);
              }, child: Text('Календарь', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, d.navInstruction);
              }, child: Text('Инструкция', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, d.navOptions);
              }, child: Text('Настройки', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
            Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
            SizedBox(
              width: d.deviceRealWidth/4,
              height: d.deviceRealHeight/30,
              child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, d.navCheckbox);
              }, child: Text('Чекбоксы', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}