import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(initialRoute: '/home', routes: {
      '/home': (context) => Home(),
      '/screen2': (context) => Screen2()
    }));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Question Controller
  late TextEditingController questionController;
List<String> question = [];

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController();
    answerController = TextEditingController();
  }

  @override
  void Qdispose() {
    questionController.dispose();
    super.dispose();
  }

  @override
  void submit() {
    Navigator.of(context).pop(questionController.text);
    questionController.clear();
  }

// Answer Controller
  late TextEditingController answerController;
List<String> answer = [];
List<Widget> dynamicList = [];

  Widget build(BuildContext context) {
    Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("New FlashCard"),
              content: Container(
                  height: 138,
                  child: Column(children: [
                    TextField(
                        autofocus: true,
                        controller: questionController,
                        onSubmitted: (_) => submit(),
                        decoration: InputDecoration(
                            hintText: 'Enter the question.',
                            labelText: 'Question',
                            border: OutlineInputBorder())),
                    SizedBox(height: 20),
                    TextField(
                        autofocus: true,
                        controller: answerController,
                        onSubmitted: (_) => submit(),
                        decoration: InputDecoration(
                            hintText: 'Enter the answer.',
                            labelText: 'Answer',
                            border: OutlineInputBorder()))
                  ])),
              actions: [
                TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text('Submit'))
              ],
            ));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("FlashCards", style: TextStyle(fontSize: 30)),
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
                  child: GridView.builder(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      )
                      itemCount: dynamicList.length,
                      itemBuilder: (_, index) => dynamicList[index])),

              Row(children: [
                Spacer(),
                FloatingActionButton(
                    onPressed: () async {
                      final question = await openDialog();
                      if (question == null || question.isEmpty) return;
                      setState(() => question.add(questionController.text);

                      final answer = await openDialog();
                      if (answer == null || answer.isEmpty) return;
                      setState(() => answer.add(answerController.text);
                      ;
                    },
                    child: Icon(Icons.plus_one))
              ]),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text("Cards"))),
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/screen2');
                        },
                        child: Text("Practice")))
              ]),
              SizedBox(height: 15),
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
            ]),
            SizedBox(height: 10),
          ])));
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String?> answerDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
            title: Text("New FlashCard"),
            content: Container(height: 138, child: Text("Answer3"))));

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
                  width: 340,
                  child: Card(
                      color: Colors.grey[900],
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Column(children: [
                        SizedBox(height: 10),
                        Text("Card #3",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Spacer(),
                        Text("Title3",
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        Spacer()
                      ]))),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 120,
                    child: TextButton(
                        onPressed: () async {
                          final answer = await answerDialog();
                        },
                        child: Text("Show Answer"))),
                IconButton(
                    onPressed: () {}, // for next random flashcard
                    icon: Icon(Icons.navigate_next_sharp,
                        color: Colors.white, size: 75))
              ]),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text("Cards"))),
                Container(
                    color: Colors.grey[900],
                    height: 40,
                    width: 80,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/screen2');
                        },
                        child: Text("Practice")))
              ])
            ])));
  }
}
