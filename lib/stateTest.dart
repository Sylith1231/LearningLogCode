import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Sources doesn't need changing.
  List<String> sources = [
    'https://www.durham.ac.uk/media/durham-university/colleges/hatfield-college/Hatfield-College-Crest-Only.png',
    'https://www.durham.ac.uk/media/durham-university/colleges/collingwood-college-/Collingwood-College-Crest-Only.png',
    'https://www.durham.ac.uk/media/durham-university/colleges/college-of-st-hild-amp-st-bede/Hild-Bede-Crest-Only.png',
    'https://www.durham.ac.uk/media/durham-university/colleges/st-aidanx27s-college/St-Aidens-Crest-2020.png',
  ];
  //Colleges doesn't need changing.
  List<String> colleges = [
    'Hatfield',
    'Collingwood',
    'Hild Bede',
    'St Aiden\'s',
  ];

  //loading doesn't need changing
  bool loading = false;

  //selectedSource is the index used to select a source from 'sources'.
  int? selectedSource;

  //Write code in initState to set the default image to St Aiden's.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //If you can work out how, use the ternary operator to display the
            // 'CircularProgressIndicator()' widget when loading is true.
            Image.network(
              sources[selectedSource!],
              height: 100,
            ),
            for (int i = 0; i < 4; i++)
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  await Future.delayed(
                    Duration(seconds: 1),
                  );
                  //Write button functionality below this line and above the next comment.

                  ////////////////////////////////////////////////////////////////////////
                  setState(() {
                    loading = false;
                  });
                },
                child: Text(colleges[i]),
              ),
          ],
        ),
      ),
    );
  }
}
