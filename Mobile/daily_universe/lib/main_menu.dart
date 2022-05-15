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
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 5, color: Colors.black)
                )
              ),
              padding: const EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width,
              height: 185,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 45,
                        child: Row(children: [
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              onTap: () { 
                                Navigator.pushNamed(context, '/reg');
                              },
                              child: Icon(Icons.settings, size: 40,),
                            )
                          ),
                          const SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              child: Icon(Icons.headset_mic, size: 40,),
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-180,
                          ),
                          const SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              child: Icon(Icons.calendar_today, size: 40,),
                            ),
                          ),
                          const SizedBox(
                            width: 45,
                            height: 45,
                            child: Icon(Icons.account_box, size: 47,),
                          )

                        ]),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: Row(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width/2) - MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text("Май", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                              child: InkWell (
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black, spreadRadius: 3),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text("Понедельник, 16 мая", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18), textAlign: TextAlign.center,)
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width/2) - MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text("2022 г.", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container (
                        margin: const EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Пн"),
                                Text("01")
                              ],)
                            ),
                          ),
                                              Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Вт"),
                                Text("02")
                              ],)
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Ср"),
                                Text("03")
                              ],)
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Чт"),
                                Text("04")
                              ],)
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Пт"),
                                Text("05")
                              ],)
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Сб"),
                                Text("06")
                              ],)
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: (MediaQuery.of(context).size.width-80)/7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, spreadRadius: 3),
                              ],
                            ),
                            child: InkWell(
                              child: Column(children: const [
                                Text("Вс"),
                                Text("07")
                              ],)
                            ),
                          ),
                        ]),  
                      ),
                    ]
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-245,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, spreadRadius: 5),
                  ],
                ),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        color: Colors.red,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        color: Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        color: Colors.purple,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-20,
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        color: Colors.cyan,
                      )
                    ]
                  ),
                )
              )
            )
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Спорт',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Отдых',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack),
            label: 'Работа',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Еда',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

