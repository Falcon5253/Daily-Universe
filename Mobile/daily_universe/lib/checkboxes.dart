import 'package:flutter/material.dart';

// Переменная хранящая в себе все элементы класса CheckField
Map<int, CheckField> checkboxesList = {};
// Переменная передается в другой виджет любым способом, например:



int uniqueCheckFieldIdTransfer = 0;
bool uniqueCheckFieldValueTransfer = false;


class CheckField extends StatefulWidget {
  final int checkId;
  final bool checkValue;
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
  bool isDeleted = false;
  _CheckFieldState();
  
  @override
  Widget build(BuildContext context) {
    return isDeleted ? const SizedBox.shrink() : Container(
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
                      isDeleted = true;
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


// Для добавления новых обьектов CheckField используйте следующую функцию
void addCheckbox(int id, bool value) { 
  checkboxesList.addEntries([MapEntry(id, CheckField(id, value))]);
}
// Пример:  addCheckbox(0, false)



// Для отрисовки всех чекбоксов можно использовать колонки
// можете передать их туда в виде массива следующим образом:
//  Column (
//    children: checkboxesList.values.toList()
//  )