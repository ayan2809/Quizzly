import 'package:flutter/material.dart';
import 'quiz_brain.dart';
//import 'package:alert/alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain =QuizBrain();
void main() => runApp(Quizzly());

class Quizzly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Center(
            child: Text('Quizzly',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'SourceCodePro'
              ),
            ),
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // List <String> questions=[
  //   'Joe Biden won the presidential elections',
  //   'Abraham_Lincoln	Was Abraham Lincoln the sixteenth President of the United States?',
  //   'Do all ducks "quack"?',
  //   'A slugs blood is green',
  //   'Are elephants mammals?	',
  // ];
  // List <bool> answers=[ true, true, false, true, true,];
  // Question q1 = Question(q: "Joe Biden won the presidential elections.", a: true);



  List <Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),

  ];

  void checkAnswer(bool userPickedAnswer)
  {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if(userPickedAnswer==correctAnswer)
     { print("User got it right");
     scoreKeeper.add(
         Icon(
           Icons.check,color: Colors.green));
     Alert(
       context: context,
       title: "Correct Answer",
       //desc: "Flutter is more awesome with RFlutter Alert.",
       image: Image.asset("assets/success.png"),
     ).show();
     }
    else
     { print("User got it wrong");
     scoreKeeper.add(
     Icon(
     Icons.close,color: Colors.red,));
     Alert(
       context: context,
       title: "Wrong Answer",
       //desc: "Flutter is more awesome with RFlutter Alert.",
       image: Image.asset("assets/wrong.png"),
     ).show();
     }

    setState(() {
      quizBrain.nextQuestion();
      // scoreKeeper.add(
      //     Icon(
      //       Icons.close,color: Colors.green,)
      //);
    });

  }



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
                quizBrain.getQuestionText(),
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
                      checkAnswer(true);
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
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}