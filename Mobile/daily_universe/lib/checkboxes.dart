import 'package:flutter/material.dart';

// Переменная хранящая в себе все элементы класса CheckField
Map<int, CheckField> checkboxesList = {};
// Переменная передается в другой виджет любым способом, например:
//   children: checkboxesList.keys.map( (key) => CheckField(key, checkboxesList)).toList()



int uniqueCheckFieldIdTransfer = 0;
bool uniqueCheckFieldValueTransfer = false;


class CheckField extends StatefulWidget {
  int checkId;
  bool checkValue;
  CheckField(this.checkId, this.checkValue, {Key? key}) : super(key: key) {
    uniqueCheckFieldIdTransfer = checkId;
    uniqueCheckFieldValueTransfer = checkValue;
  }

  @override
  State<CheckField> createState() => _CheckFieldState();
}

class _CheckFieldState extends State<CheckField> {
  int checkId = uniqueCheckFieldIdTransfer;
  bool checkValue = uniqueCheckFieldValueTransfer;
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
              checkValue = !checkValue;
            });
          },
          child: Row(
            children: [
              Checkbox(value: checkValue, onChanged: (value) => setState(() {
                checkValue = value!;
              })),
              SizedBox(
                child: Text("Checkbox number $checkId"),
                width: MediaQuery.of(context).size.width - 148,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  )
                ),
                height: 80,
                width: 80,
                child:  InkWell(
                  onTap: () {
                    setState(() {
                      checkboxesList.remove(checkId);
                    });
                  },
                  child: const Icon(
                    Icons.highlight_remove_rounded,
                    size: 24,
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}



// Для отрисовки всех объектов класса CheckField из checkboxesList можно использовать
// Widget CustomScrollView, например так:
//    CustomScrollView(
//      slivers: [
//        SliverFillRemaining(
//          hasScrollBody: false,
//          child: Column(
//           children: checkboxesList.keys.map( (key) => CheckField(key, checkboxesList)).toList()
//          )
//        )
//      ]
//    )
//
// void addCheckbox { 
//   checkboxesList.addEntries([MapEntry(++_count, ["false", "text $_count"])]);
// }