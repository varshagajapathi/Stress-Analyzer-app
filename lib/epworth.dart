import 'package:flutter/material.dart';

class epworth extends StatefulWidget {
  const epworth({super.key});

  @override
  State<epworth> createState() => _epworthState();
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
class _epworthState extends State<epworth> {
  List<Question> questions = [
    Question(
      'Question 1 : Sitting and reading',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 2 : Watching TV ',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 3 : Sitting inactive in a public place (e.g., a theater or a meeting)',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 4 : As a passenger in a car for an hour without a break',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 5 : Lying down to rest in the afternoon when circumstances permit',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 6 : Sitting and talking to someone',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 7 : Sitting quietly after a lunch without alcohol',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
    Question(
      'Question 8 : In a car, while stopped for a few minutes in traffic',
      [
        Option('No chance of dozing', 0),
        Option('Slight chance of dozing', 1),
        Option('Moderate chance of dozing ', 2),
        Option('High chance of dozing ', 3),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DayTime Sleepiness Test'),
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
    String sleepiness;
    if (totalScore >= 0 && totalScore <= 7) {
      sleepiness = 'It is unlikely that you are abnormally sleepy';
    } else if (totalScore >= 8 && totalScore <= 9) {
      sleepiness = 'You have an average amount of daytime sleepiness.';
    } else if (totalScore >= 10 && totalScore <= 15) {
      sleepiness = ':You may be excessively sleepy depending on the situation. You may want to consider seeking medical attention.';
    } else {
      sleepiness = 'You are excessively sleepy and should consider seeking medical attention.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Daytime Sleepiness Test Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your EPWORTH score is $totalScore'),
            SizedBox(height: 16),
            Text(' $sleepiness'),
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
