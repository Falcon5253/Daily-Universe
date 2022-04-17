import 'package:flutter/material.dart';


Map<int, List<String>> map = {};
int count = 0;

class CheckField extends StatefulWidget {
  const CheckField( {Key? key}) : super(key: key);

  @override
  State<CheckField> createState() => _CheckFieldState();
}

class _CheckFieldState extends State<CheckField> {
  int id = count;
  _CheckFieldState();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width - 20,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              bool newValue = !(map[id]![0] == "true");
              map[id]![0] = newValue.toString();
            });
          },
          child: Row(
            children: [
              Checkbox(value: map[id]![0] == "true", onChanged: (value) => setState(() {
                map[id]![0] = value!.toString();
              })),
              SizedBox(
                child: Text(map[id]![1].toString()),
                width: 100,
              ),
              SizedBox(
                width: 100,
                child: Text(map[id]![0].toString())
              )
            ]
          )
        )
      )
    );
  }
}

// Для полноценного использования класса
// создаются следующая переменная:
//   final Map<int, List<String>> _map = {};
//
//
// Переменная передается в другой виджет любым способом, например:
//   children: _map.keys.map( (key) => CheckField(key, _map)).toList()
//
// Для отрисовки всех объектов класса CheckField из _map можно использовать
// Widget CustomScrollView, например так:
//    CustomScrollView(
//      slivers: [
//        SliverFillRemaining(
//          hasScrollBody: false,
//          child: Column(
//           children: _map.keys.map( (key) => CheckField(key, _map)).toList()
//          )
//        )
//      ]
//    )
//
// void addCheckbox { 
//   _map.addEntries([MapEntry(++_count, ["false", "text $_count"])]);
// }