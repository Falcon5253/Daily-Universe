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
                                Navigator.pushNamed(context, d.navOptions);
                              },
                              child: Icon(Icons.settings, size: 40,),
                            )
                          ),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              child: 
                              InkWell (
                                onTap: () { 
                                Navigator.pushNamed(context, d.navInstruction);
                                },
                                child: Icon(Icons.headset_mic, size: 40,)
                              )
                              
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-180,
                          ),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              onTap: () { 
                                Navigator.pushNamed(context, d.navCalendar);
                              },
                              child: Icon(Icons.calendar_today, size: 40,),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: InkWell(
                              onTap: () { 
                                Navigator.pushNamed(context, d.navReg);
                              },
                              child: Icon(Icons.account_box, size: 47,),
                            )
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
                              child: const Text("??????", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                                    child: Text("??????????????????????, 16 ??????", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18), textAlign: TextAlign.center,)
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width/2) - MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text("2022 ??.", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                                Text("????"),
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
                                Text("????"),
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
                                Text("????"),
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
                                Text("????"),
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
                                Text("????"),
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
                                Text("????"),
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
                                Text("????"),
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
            label: '??????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: '??????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack),
            label: '????????????',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: '??????',
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







// body:   Center(
//   child: Column(
//     children: [
//       // Row(
//       //   children: [Text("1")],
//       // ),
//       // Row(
//       //   children: [Text("2")],
//       // ),
//       // Row(
//       //   children: [Text("3")],
//       // )
//       Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/32)),
//       SizedBox(
//         width: d.deviceRealWidth/4,
//         height: d.deviceRealHeight/30,
//         child: ElevatedButton(onPressed: () {
//           Navigator.pushNamed(context, d.navCalendar);
//         }, child: Text('??????????????????', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
//       ),
//       Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
//       SizedBox(
//         width: d.deviceRealWidth/4,
//         height: d.deviceRealHeight/30,
//         child: ElevatedButton(onPressed: () {
//           Navigator.pushNamed(context, d.navInstruction);
//         }, child: Text('????????????????????', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
//       ),
//       Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
//       SizedBox(
//         width: d.deviceRealWidth/4,
//         height: d.deviceRealHeight/30,
//         child: ElevatedButton(onPressed: () {
//           Navigator.pushNamed(context, d.navOptions);
//         }, child: Text('??????????????????', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
//       ),
//       Padding(padding: EdgeInsets.only(top: d.deviceRealHeight/128)),
//       SizedBox(
//         width: d.deviceRealWidth/4,
//         height: d.deviceRealHeight/30,
//         child: ElevatedButton(onPressed: () {
//           Navigator.pushNamed(context, d.navCheckbox);
//         }, child: Text('????????????????', style: TextStyle(color: d.defaultTextColor, fontSize: 18)),),
//       ),
//     ],
//   ),
// ),
