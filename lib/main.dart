import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flashcards", style: TextStyle(fontSize: 30)),
          backgroundColor: Colors.black,
        ),
        body: Container(
            color: Colors.black,
            child: Column(children: [
              Divider(
                height: 35,
                thickness: 1,
                indent: 75,
                endIndent: 75,
                color: Colors.grey,
              ),
              Container(
                  height: 400,
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        flashCard(),
                        flashCard(),
                        flashCard(),
                        flashCard(),
                      ])),
              Row(children: [
                Spacer(),
                FloatingActionButton(
                    onPressed: () {}, child: Icon(Icons.plus_one))
              ]),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child: TextButton(onPressed: () {}, child: Text("Cards"))),
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child:
                        TextButton(onPressed: () {}, child: Text("Practice")))
              ])
            ])));
  }
}

Widget flashCard() {
  return Container(
      color: Colors.grey[900],
      child: Card(
          color: Colors.grey[900],
          margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(children: [
            Text("Title", style: TextStyle(fontSize: 20, color: Colors.white)),
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text("Answer",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              Icon(Icons.delete, color: Colors.white)
            ])
          ])));
}
