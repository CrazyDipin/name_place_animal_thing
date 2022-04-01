import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:name_place_animal_thing/join_existing_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Name, Place, Animal, Thing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Name, Place, Animal, Thing',
              style: TextStyle(fontSize: 50, fontFamily: 'Schoolbell'),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HowToPlay()),
                );
              },
              child: const Text(
                'How To play',
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 25, fontFamily: 'Schoolbell'),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                fixedSize: MaterialStateProperty.all(const Size(220, 66)),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 5)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JoinExistingGame()),
                );
              },
              child: const Text(
                'Join Existing Game',
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 25, fontFamily: 'Schoolbell'),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                fixedSize: MaterialStateProperty.all(const Size(220, 66)),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text(
                'Create New Game',
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 25, fontFamily: 'Schoolbell'),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                fixedSize: MaterialStateProperty.all(const Size(220, 66)),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        CustomBlock(
            text1: 'How To Play',
            text2:
                'The game is simple. The game creator sets the number of rounds and chooses the word categories. The game is player over a couple of rounds. At the beginning of every round, players get a new alphabet. Your job is to think of words that begin with that letter and fit the categories in the game. Each game round is timed at 60 seconds, but the game alsos end as soon as the first person submits their response. Think fast!'),
        const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
        CustomBlock(
          text1: 'Creating A Game and Game Setup',
          text2:
              'Head on over to the "Create New Game" section on the previous page to create a new game. You will be able to specify the number of rounds you would like to play as well as any additional categories you would want to include besides, "Name", "Place", "Animal" and "Thing". You can also define "scoring mechanics". Select "Score Yourself" if you want people to score themselves, or select "Score Each Other" to score your friends. Once you have created the game, you will get a "Game Code". Create the room and send the Game Code to your friends who will be able to use it join the room. Once your friends have joined, the creator will be able to start the game!',
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
        CustomBlock(
          text1: 'Scoring Rules',
          text2: 'Scoring Rules are simple:',
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
        MyBullet(text: '+10 points for each unique answer'),
        MyBullet(text: '+5 points for each non-unique answer'),
        MyBullet(text: '0 points for no answer'),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Understood, Let\'s Go!',
            ),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Schoolbell',
                    color: Colors.white),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              fixedSize: MaterialStateProperty.all(const Size(243.65, 66)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        )
      ]),
    ));
  }
}

class MyBullet extends StatelessWidget {
  MyBullet({this.text = 'default'});
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: <Widget>[
        const Padding(padding: EdgeInsets.fromLTRB(70, 0, 0, 0)),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
        Text(
          text,
          style: const TextStyle(
              fontSize: 18.72,
              fontFamily: 'Schoolbell',
              fontWeight: FontWeight.bold),
        ),
      ]),
      const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
    ]);
  }
}

class CustomBlock extends StatelessWidget {
  CustomBlock({this.text1 = 'default', this.text2 = 'default'});
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: <Widget>[
        const Padding(padding: EdgeInsets.fromLTRB(50, 50, 0, 5)),
        Text(
          text1,
          style: const TextStyle(
              fontFamily: 'Schoolbell',
              fontSize: 32,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ]),
      Row(children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxWidth: 1500),
          padding: const EdgeInsets.fromLTRB(50, 5, 0, 5),
          child: Text(
            text2,
            style: const TextStyle(
                fontFamily: 'Schoolbell',
                fontSize: 18.72,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    ]);
  }
}
