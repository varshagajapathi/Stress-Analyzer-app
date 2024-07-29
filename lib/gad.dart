import 'package:flutter/material.dart';
import 'dart:math';


class gad extends StatefulWidget {
  const gad({super.key});

  @override
  State<gad> createState() => _gadState();
}
class Question {
  final String text;
  final List<Option> options;
  int selectedOptionIndex = -1; // -1 represents no option selected

  Question(this.text, this.options);
}

class Option {
  final String text;
  final int score;

  Option(this.text, this.score);
}

class _gadState extends State<gad> {
  List<Question> questions = [
    Question(
      'Question 1 :  Feeling nervous, anxious or on edge? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 2 :  Not being able to stop or control worrying? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 3 :  Worrying too much about different things? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 4 :  Trouble relaxing? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 5 :  Being so restless that it is hard to sit still? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 6 :  Becoming easily annoyed or irritable? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 7 :  Feeling afraid as if something awful might happen? ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anxiety Test'),
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/back.png'),
    fit: BoxFit.cover,
    ),
    ),
    child: ListView.builder(
    itemCount: questions.length,
    itemBuilder: (context, index) {
    final question = questions[index];
    return Card(
    child: Column(
    children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(question.text, style: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,),textAlign: TextAlign.justify,),
    ),
    ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: question.options.length,
    itemBuilder: (context, optionIndex) {
    final option = question.options[optionIndex];

    return RadioListTile<int>(
    title: Text(option.text),
    value: optionIndex,
    groupValue: question.selectedOptionIndex,
    onChanged: (value) {
    setState(() {
    question.selectedOptionIndex = value!;
    });
    },
    );
    },
    ),
    ],
    ),
    );
    },
    ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculateScore,
        child: Text('Submit'),
        backgroundColor: Colors.red,
      ),
    );
  }
  void calculateScore() {
    int totalScore = 0;

    for (final question in questions) {
      if (question.selectedOptionIndex != -1) {
        totalScore += question.options[question.selectedOptionIndex].score;
      }
  }
    String anxietyLevel;
    if (totalScore >= 0 && totalScore <= 4) {
      anxietyLevel = 'Minimal Anxiety';
    } else if (totalScore >= 5 && totalScore <= 9) {
      anxietyLevel = 'Mild Anxiety';
    } else if (totalScore >= 10 && totalScore <= 14) {
      anxietyLevel = 'Moderate Anxiety';
    } else {
      anxietyLevel = 'Severe Anxiety';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Anxiety Test Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your GAD-7 score is $totalScore'),
            SizedBox(height: 16),
            Text('Anxiety Level: $anxietyLevel'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK', style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }
}

