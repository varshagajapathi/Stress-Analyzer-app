import 'package:flutter/material.dart';

class phq extends StatefulWidget {
  const phq({super.key});

  @override
  State<phq> createState() => _phqState();
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

class _phqState extends State<phq> {
  List<Question> questions = [
    Question(
      'Question 1 :  Little interest or pleasure in doing things ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 2 :  Feeling down, depressed or hopeless ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 3 :  Trouble falling asleep, staying asleep, or sleeping too much ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 4 :  Feeling tired or having little energy ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 5 :  Poor appetite or overeating ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 6 :  Feeling bad about yourself - or that you’re a failure or have let yourself or your family down ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 7 :  Trouble concentrating on things, such as reading the newspaper or watching television',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 8 : Moving or speaking so slowly that other people could have noticed. Or, the opposite - being so fidgety or restless that you have been moving around a lot more than usual ',
      [
        Option('Not at all', 0),
        Option('Several days', 1),
        Option('More than half the days', 2),
        Option('Nearly every day', 3),
      ],
    ),
    Question(
      'Question 9 :  Thoughts that you would be better off dead or of hurting yourself in some way ',
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
                      color: Colors.black,),textAlign: TextAlign.justify,maxLines: 3,),
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
    String depressionLevel;
    if (totalScore >= 0 && totalScore <= 4) {
      depressionLevel = 'Minimal Depression';
    } else if (totalScore >= 5 && totalScore <= 9) {
      depressionLevel = 'Mild Depression';
    } else if (totalScore >= 10 && totalScore <= 14) {
      depressionLevel = 'Moderate Depression';
    } else if(totalScore >= 15 && totalScore <= 19){
      depressionLevel = 'Moderately Severe Depression';
    }else{
      depressionLevel = 'Severe Depression';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Depression Test Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your PHQ-9 score is $totalScore'),
            SizedBox(height: 16),
            Text('Depression Level: $depressionLevel'),
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
