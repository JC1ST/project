import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            WebsafeSvg.asset("assets/bg.svg", fit: BoxFit.fill),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 2),
                    Text(
                      "Capital City Quiz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   "Enter your informations below",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Spacer(),
                    // TextField(
                    //   controller: _textController,
                    //   decoration: InputDecoration(
                    //     hintText: "Write Name",
                    //     fillColor: Color.fromARGB(255, 179, 189, 231),
                    //     filled: true,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    // ),
                    Spacer(flex: 2),
                    InkWell(
                      onTap: () => Get.to(QuizScreen()),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 26, 202, 202),
                              Color.fromARGB(255, 149, 213, 238),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Let's Start Quiz",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
