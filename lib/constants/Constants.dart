import 'package:quize_app/data/Questions.dart';

List<Question> getQuestionsList() {
  var firstQuestion = Question();
  firstQuestion.questionTitle = 'مشهور ترین شعبده‌باز جهان کیست؟';
  firstQuestion.imageNameNumber = '1';
  firstQuestion.correctAnswer = 2;
  firstQuestion.answerList = [
    'امیراحمدادیبی',
    'دیوید کاپرفیلد',
    'هری هودینی',
    'دیوید بلین'
  ];

  var secondQuestion = Question();
  secondQuestion.questionTitle = 'چه کشوری ایستگاه فضایی میر را بنا کرد؟';
  secondQuestion.imageNameNumber = '2';
  secondQuestion.correctAnswer = 0;
  secondQuestion.answerList = ['(شوروی سابق)روسیه', 'آمریکا', 'چین', 'هند'];

  var tirdQuestion = Question();
  tirdQuestion.questionTitle = 'چند درصد سطح کره زمین را آب پوشانده است؟';
  tirdQuestion.imageNameNumber = '3';
  tirdQuestion.correctAnswer = 1;
  tirdQuestion.answerList = ['40', '70', '65', '80'];

  var fourthQuestion = Question();
  fourthQuestion.questionTitle = 'کدام یک از موارد زیر نام یک اقیانوس نیست؟';
  fourthQuestion.imageNameNumber = '4';
  fourthQuestion.correctAnswer = 3;
  fourthQuestion.answerList = ['آرام', 'هند ', 'اطلس ', 'بزرگ '];

  Question().answerList?.shuffle();

  return [secondQuestion, firstQuestion, tirdQuestion, fourthQuestion];
}
