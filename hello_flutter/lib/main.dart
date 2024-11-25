import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/custom_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage2());
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomGesture'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'IT guys',
            style: TextStyle(
              fontSize: 24.0, // Thay đổi cỡ chữ
              fontWeight: FontWeight.bold, // Đậm (tùy chọn)
              color: Colors.blue, // Màu sắc (tùy chọn)
            ),
          ),
          Expanded(
              // Giới hạn chiều cao của ListView
              child: ManagePeople()),
        ],
      ),
    );
  }
}

enum EOptions {
  option1,
  option2,
  option3,
}

enum SearchType { web, image, news, shopping }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Set<String> selected = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My home page 1"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
            key: _key,
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onSaved: (val) => print("Form saved: $val"),
              validator: (val) => (val == null || val.isEmpty)
                  ? "Please enter some text"
                  : null,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                print('Form submitted');
              }
            },
            child: const Text('Submit'),
          ),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.delete)),
          TextButton(
            onPressed: () => {},
            child: const Text('Delete'),
          ),
          SegmentedButton(
            segments: const [
              ButtonSegment(label: Text('Option1'), value: 'option1'),
              ButtonSegment(label: Text('Option2'), value: 'option2'),
              ButtonSegment(label: Text('Option3'), value: 'option3'),
            ],
            selected: selected,
            onSelectionChanged: (val) => setState(() => selected = val),
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
          ),
          Dismissible(
// Give it a blue background if swiped right and
// a red background if swiped left
            background: Container(color: Colors.blue),
            secondaryBackground: Container(color: Colors.red),
            onDismissed: (direction) => print("You swiped $direction"),
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            child: const ListTile(title: Text('Item Title')),
          ),
          //const ManagePeople()
        ])));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var isChecked = false;
  EOptions? selectedValue;
  int numberOfResults = 0;
  SearchType searchType = SearchType.web;

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: const Text("A SnackBar"),
      action: SnackBarAction(label: "Undo", onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello Flutter"),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'you@email.com',
                    icon: Icon(Icons.contact_mail),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", icon: Icon(Icons.password)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(16),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Credit Card", icon: Icon(Icons.phone_android)),
              ),
            ),
            Switch(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val!;
                  });
                }),
            Text(isChecked ? 'Checked' : 'Unchecked'),
            Radio<EOptions>(
                value: EOptions.option1,
                groupValue: selectedValue,
                onChanged: (EOptions? val) {
                  setState(() {
                    selectedValue = val;
                  });
                }),
            Radio<EOptions>(
                value: EOptions.option2,
                groupValue: selectedValue,
                onChanged: (EOptions? val) {
                  setState(() {
                    selectedValue = val;
                  });
                }),
            Radio<EOptions>(
                value: EOptions.option3,
                groupValue: selectedValue,
                onChanged: (EOptions? val) {
                  setState(() {
                    selectedValue = val;
                  });
                }),
            Text('Selected value: $selectedValue'),
            Slider(
              label: numberOfResults.toString(),
              min: 0.0,
              max: 100.0,
              divisions: 10,
              value: numberOfResults.toDouble(),
              onChanged: (val) {
                setState(() => numberOfResults = val.round());
              },
            ),
            DropdownButton(
                value: searchType,
                items: const [
                  DropdownMenuItem(value: SearchType.web, child: Text('Web')),
                  DropdownMenuItem(
                      value: SearchType.image, child: Text('Image')),
                  DropdownMenuItem(value: SearchType.news, child: Text('News')),
                  DropdownMenuItem(
                      value: SearchType.shopping, child: Text('Shopping'))
                ],
                onChanged: (val) {
                  setState(() => searchType = val!);
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _showSnackBar),
    );
  }
}
