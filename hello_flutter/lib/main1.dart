import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_flutter/custom_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'An app that can count to'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const categories = [
    "Automotive",
    "Books",
    "Electronics",
    "Food",
    'Programming languages'
  ];
  static const products = [
    ["Car", "Tyre", "Fuel", "Oil"],
    ["Programming Book", "Novel", "Politics Book", "Business Book"],
    ["Desktop Computer", "Laptop", "Computer keyboard"],
    ["Pasta", "Pizza", "Bread" "Cheese", "Ham", "Sausage", "Beef"],
    ['Kotlin', 'Java', 'PHP', 'Python', 'C#', 'C++', 'XML']
  ];
  int _a = 0;
  void _increment() => setState(() => _a++);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} $_a'),
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) => Column(
                children: <Widget>[
                  Text(
                    categories[i],
                    style: const TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemBuilder: (context, i) => ListTile(
                        leading: const Icon(Icons.list),
                        title: Text("title number ${i + 1}"),
                        subtitle: const Text("subtitle"),
                      ),
                    ),
                    /* child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: products[i].length,
                    //   itemBuilder: (context, j) => Padding(
                    //     padding: const EdgeInsets.only(right: 8),
                    //     child: Card(
                    //       child: Padding(
                    //           padding: const EdgeInsets.all(10.0),
                    //           child: Text(
                    //             products[i][j],
                    //             style: const TextStyle(fontSize: 10),
                    //           )),
                    //     ),
                    //   ),
                    */
                  ),
                  const Divider(
                    thickness: 10,
                  )
                ],
              )),
      floatingActionButton: OurButton(
        text: 'Make the counter ${_a + 1}',
        textColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColorLight,
        onPressed: _increment,
      ),
    );
  }
}
