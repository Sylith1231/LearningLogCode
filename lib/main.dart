//You'll need to import this library in almost every Dart file you create.
//it contains most of Flutter's core functionality and that's about all you need to know,
//but you can find out more if you're interested by hovering over the package
//and following the link.
import 'package:flutter/material.dart';

//The 'main' function is the entry point for your app. Your app must have EXACTLY one main function.
//This is where you place code that should run before the app launches. That's a bit complex for now,
//so just think of it as the root of your app.
void main() {
  runApp(const MyApp());
}

//This is a custom (stateless) widget called 'MyApp'.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Every widget (custom and otherwise) must have a 'build' method. The build method is what paints the
  //content on the screen. It takes an argument of type 'BuildContext' and returns a widget.
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          //<Widget>[] is Dart syntax for a list whose elements are all of the type 'Widget'.
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Text(
              'Hello World',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.network(
              'https://logos-download.com/wp-content/uploads/2020/06/Durham_University_Logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            ElevatedButton(
              onPressed: () {
                print('Button pressed');
              },
              child: Text('Press me to print a message.'),
            ),
          ],
        ),
      ),
    );
  }
}
