import 'package:flutter/material.dart';
import 'package:quize_app/constants/Constants.dart';
import 'package:quize_app/data/Questions.dart';
import 'package:quize_app/screen/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int showQuestionIndex = 0;
  Question? selectedQuestion;
  bool isFinalAnswerSubmitted = false;
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    selectedQuestion = getQuestionsList()[showQuestionIndex];

    String questionImageIndex =
        getQuestionsList()[showQuestionIndex].imageNameNumber!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(
          ' سوال ${showQuestionIndex + 1} از ${getQuestionsList().length}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Image.asset('images/$questionImageIndex.png', height: 300),
            SizedBox(height: 30),
            Text(
              selectedQuestion!.questionTitle!,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 30),
            ...List.generate(
              4,
              (index) => getOptionsItem(index),
            ),
            if (isFinalAnswerSubmitted)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ResultScreen(
                        correctAnswer: correctAnswer,
                      ),
                    ),
                  );
                },
                child: Text(
                  'مشاهده نتایج کوییز',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget getOptionsItem(int index) {
    return ListTile(
      title: Text(
        selectedQuestion!.answerList![index],
        textAlign: TextAlign.end,
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          correctAnswer++;
        }

        if (showQuestionIndex == getQuestionsList().length - 1) {
          isFinalAnswerSubmitted = true;
        }
        setState(() {
          if (showQuestionIndex < getQuestionsList().length - 1) {
            showQuestionIndex++;
          }
        });
      },
    );
  }
}
