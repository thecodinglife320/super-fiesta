import 'package:flutter/material.dart';

class ManagePeople extends StatelessWidget {
  const ManagePeople({super.key});

  List<Map> fetchPeople() {
    return [
      {"first": "Kevin", "last": "Malone"},
      {"first": "Kelly", "last": "Kapoor"},
      {"first": "Creed", "last": "Bratton"},
      {"first": "Dwight", "last": "Schrute"},
      {"first": "Andy", "last": "Bernard"},
      {"first": "Pam", "last": "Beasley"},
      {"first": "Jim", "last": "Halpert"},
      {"first": "Robert", "last": "California"},
      {"first": "David", "last": "Wallace"},
      {"first": "Ryan", "last": "Howard"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    var peopleObjects = fetchPeople();
    return ListView(
      children: peopleObjects
          .map((person) => GestureDetector(
                child: Person(person: person),
                onLongPress: () {
                  peopleObjects.remove(person);
                  print("Deleted ${person['first']}");
                },
                onScaleUpdate: (e) {
                  if (e.scale > 2) {
                    print('Pinch out');
                  }
                },
              ))
          .toList(),
    );
  }
}

class Person extends StatelessWidget {
  final Map person; // Nhận dữ liệu Map từ widget cha

  const Person({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(person['first'][0]), // Hiển thị chữ cái đầu từ `first`
      ),
      title: Text('${person['first']} ${person['last']}'), // Tên đầy đủ
      subtitle: const Text('Click for details'), // Gợi ý người dùng
      onTap: () {
        // Xử lý khi bấm vào
        print('Tapped on ${person['first']} ${person['last']}');
      },
    );
  }
}

class OurButton extends StatelessWidget {
  const OurButton(
      {super.key, required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.splashColor,
      required this.onPressed});

  final String text;
  final Color textColor, backgroundColor, splashColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      splashColor: splashColor,
      padding: ButtonTheme.of(context).padding,
      shape: const StadiumBorder(),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
