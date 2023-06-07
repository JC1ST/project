import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questionController.dart';
import 'package:quiz_app/screens/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
