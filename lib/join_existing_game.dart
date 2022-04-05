import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JoinExistingGame extends StatefulWidget {
  const JoinExistingGame({Key? key}) : super(key: key);

  State<JoinExistingGame> createState() => JoinExistingGameState();
}

class JoinExistingGameState extends State<JoinExistingGame> {
  @override
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  Future<Album>? _futureAlbum;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(//mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
        /*LabelBox(text: 'Your Name:'),
            const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 50)),
            LabelBox(text: 'Room Code:'),
            */
        const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 50)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Text('Your Name:'),
          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 5)),
          Container(
            width: 122,
            height: 49.2,
            child: TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: "enter name",
                )),
          ),
        ]),
        const Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Text('Room Code:'),
          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 5)),
          Container(
            width: 122,
            height: 49.2,
            child: TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: "enter room code",
                )),
          ),
        ]),
        const Padding(padding: EdgeInsets.fromLTRB(0, 12, 0, 12)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
              text: 'Join Your Friends!',
              action: () {
                setState(() {
                  Map data = {
                    'Name': _controller1.text,
                    'RoomCode': _controller2.text,
                  };
                  _futureAlbum = createAlbum(data);
                });
              }),
          const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
          CustomButton(
              text: 'Cancel',
              action: () {
                Navigator.of(context).pop();
              })
        ])
        /*,
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: buildFutureBuilder(),
        )
        */
      ])),
    );
  }
  /*
  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
  */
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

Future<Album> createAlbum(Map data) async {
  String body = json.encode(data);

  http.Response response =
      await http.post(Uri.parse('http://127.0.0.1:4000/name'),
          headers: {
            'content-type': 'application/json',
          },
          body: body);
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
