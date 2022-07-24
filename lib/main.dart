import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget> scoreKeeper = [];

  List<String> question = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    ' First ODI (Cricket) in India was played in Ahemadabad.',
    'Goa is famous for not producing coconut.',
    'Polo was originated in Assam.',
    'The Khalsa was born in 1699.',
    'The first captain of the first ODI Indian team was Sunil Gavaskar.',
    'Baseball originated in Australia.',
    'Ostrich\'s eyes are smaller than its brain.',
    'The Amateur Athletics Federation of India was established in 1946.',
    'Plants observe oxygen from atmosphere.',
    'The Ramayana was written by Tulsidas.',
    ' Nakshatras are 27 in numbers.',
    'Vedic astrology counts on the solar system.'
  ];
  List<bool> answer = [
    false,true,true,true,true,false,true,false,false,false,true,false,false,true,false
  ];

  int quNumber =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question[quNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.

                bool correctAnswer = answer[quNumber];
                if(correctAnswer==true){
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  );
                }
                else{
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  );
                }
                setState(() {
                  quNumber++;
                  if(quNumber >= question.length){
                    quNumber = 0;
                    scoreKeeper = [];
                  }

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answer[quNumber];
                if(correctAnswer==false){
                  scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                  );
                }
                else{
                  scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                  );
                }
                setState(() {
                  quNumber++;
                  if(quNumber >= question.length){
                    quNumber = 0;
                    scoreKeeper = [];
                  }
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
