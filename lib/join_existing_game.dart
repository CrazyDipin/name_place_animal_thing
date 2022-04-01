import 'package:flutter/material.dart';

class JoinExistingGame extends StatefulWidget {
  const JoinExistingGame({Key? key}) : super(key: key);

  State<JoinExistingGame> createState() => JoinExistingGameState();
}

class JoinExistingGameState extends State<JoinExistingGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            /*LabelBox(text: 'Your Name:'),
            const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 50)),
            LabelBox(text: 'Room Code:'),
            */
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text('Your Name:'),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 5)),
              Container(
                width: 122,
                height: 49.2,
                child: const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //labelText: "enter name",
                  )),
                ),
              ),
            ]),
            const Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text('Room Code:'),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 5)),
              Container(
                width: 122,
                height: 49.2,
                child: const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //labelText: "enter room code",
                  )),
                ),
              ),
            ]),
            const Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomButton(
                  text: 'Join Your Friends!',
                  action: () {
                    Navigator.of(context).pop();
                  }),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
              CustomButton(
                  text: 'Cancel',
                  action: () {
                    Navigator.of(context).pop();
                  })
            ])
          ])),
    );
  }
}

/*
class LabelBox extends StatefulWidget {
  String text;
  LabelBox({this.text = 'default'});

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(text),
      const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 5)),
      /*const TextField(
          decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "enter name",
      )),*/
    ]);
  }
}
*/
class CustomButton extends StatelessWidget {
  String text;
  var action;
  CustomButton({this.text = 'default', this.action});

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: Text(text),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 25, fontFamily: 'Schoolbell'),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        fixedSize: MaterialStateProperty.all(const Size(220, 66)),
      ),
    );
  }
}
