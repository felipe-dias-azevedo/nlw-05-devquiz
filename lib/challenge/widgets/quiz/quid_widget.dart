import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 32,
        ),
        Text(
          widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 24,
        ),
        for (var i = 0; i < widget.question.answers.length; i++)
          AnswerWidget(
            answer: widget.question.answers[i],
            isSelected: indexSelected == i,
            onTap: (value) {
              indexSelected = i;
              setState(() {});
              Future.delayed(Duration(seconds: 1))
                  .then((_) => widget.onSelected(value));
            },
            disabled: indexSelected != -1,
          ),
      ]),
    );
  }
}
