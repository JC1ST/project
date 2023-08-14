import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_search_safety/word_search_safety.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();

  List<WordFindQues>? listQuestions;

  @override
  void initState() {
    super.initState();
    listQuestions = [
      WordFindQues(
        question: "What is name of the character?",
        answer: "Mario",
        pathImage:
            "https://images.unsplash.com/photo-1602620502036-e52519d58d92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWFyaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60",
      ),
      WordFindQues(
        question: "What is this animal?",
        answer: "Cat",
        pathImage:
            "https://images.unsplash.com/photo-1538128835124-7805d3fd3f43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM0fHxjYXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60",
      ),
      WordFindQues(
        question: "What is name of this animal?",
        answer: "Wolf",
        pathImage:
            "https://plus.unsplash.com/premium_photo-1661899053699-f49eb65ca6a3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29sZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
      ),
      WordFindQues(
        question: "What is this fruits?",
        answer: "Lemon",
        pathImage:
            "https://images.unsplash.com/photo-1587496679742-bad502958fbf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGVtb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60",
      ),
      WordFindQues(
        question: "What is this things?",
        answer: "Scissors",
        pathImage:
            "https://images.unsplash.com/photo-1634225109865-7a7b6e4ef85c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNjaXNzb3JzfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",
      ),
      WordFindQues(
        question: "What is this fruits?",
        answer: "Watermelon",
        pathImage:
            "https://images.unsplash.com/photo-1589984662646-e7b2e4962f18?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2F0ZXJtZWxvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1686052148422-a9b6975931ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJsYWNrJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    globalKey.currentState!.generatePuzzle(
                        loop: listQuestions!
                            .map((ques) => ques.clone())
                            .toList());
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text(
                    'Reload',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: Colors.lightBlue,
                      child: WordFindWidget(
                        constraints.biggest,
                        listQuestions!.map((ques) => ques.clone()).toList(),
                        key: globalKey,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WordFindWidget extends StatefulWidget {
  final Size? size;
  final List<WordFindQues>? listQuestions;
  const WordFindWidget(this.size, this.listQuestions, {super.key});

  @override
  State<WordFindWidget> createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  Size? size;
  List<WordFindQues>? listQuestions;
  int indexQues = 0;
  int hintCount = 0;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions![indexQues];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1686052148422-a9b6975931ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJsYWNrJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => generateHint(),
                  child: const Icon(
                    Icons.healing_outlined,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => generatePuzzle(left: true),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 42,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => generatePuzzle(next: true),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 42,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: size!.width / 2 * 1.5,
                  // maxHeight: size!.height / 2,
                ),
                child: Image.network(
                  currentQues.pathImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              currentQues.question,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: currentQues.puzzles.map((puzzle) {
                    Color? color = Colors.blue;

                    if (currentQues.isDone) {
                      color = Colors.green[400];
                    } else if (puzzle.hintShow) {
                      color = Colors.white.withOpacity(0.2);
                    } else if (currentQues.isFull) {
                      color = Colors.red[300];
                    } else {
                      color = Colors.blue;
                    }

                    return InkWell(
                      onTap: () {
                        if (puzzle.hintShow || currentQues.isDone) return;

                        currentQues.isFull = false;
                        puzzle.clearValue();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: currentQues.answer.length < 7
                            ? constraints.biggest.width / 7 - 17
                            : constraints.biggest.width / 7 - 25,
                        height: currentQues.answer.length < 7
                            ? constraints.biggest.width / 7 - 17
                            : constraints.biggest.width / 7 - 25,
                        margin: const EdgeInsets.all(3),
                        child: Text(
                          (puzzle.currentValue ?? '').toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 16,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool statusBtn = currentQues.puzzles
                        .indexWhere((puzzle) => puzzle.currentIndex == index) >=
                    0;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          currentQues.arrayBtns![index].toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (!statusBtn) {
                            setBtnClick(index);
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void generatePuzzle({
    List<WordFindQues>? loop,
    bool next = false,
    bool left = false,
  }) {
    if (loop != null) {
      indexQues = 0;
      listQuestions = <WordFindQues>[];
      listQuestions!.addAll(loop);
    } else {
      if (next && indexQues < listQuestions!.length - 1) {
        indexQues++;
      } else if (left && indexQues > 0) {
        indexQues--;
      } else if (indexQues >= listQuestions!.length - 1) {
        return;
      }
      setState(() {});
      if (listQuestions![indexQues].isDone) return;
    }

    WordFindQues currentQues = listQuestions![indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];
    final WSSettings ws = WSSettings(
      width: 16,
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );
    final WordSearchSafety wordSearch = WordSearchSafety();
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors!.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle!.expand((list) => list).toList();
      currentQues.arrayBtns!.shuffle();

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindChar(
            correctValue: currentQues.answer.split("")[index],
          );
        });
      }
    }

    hintCount = 0;
    setState(() {});
  }

  generateHint() async {
    WordFindQues currentQues = listQuestions![indexQues];
    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.isNotEmpty) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) {
          countTemp++;
        }

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns!
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions![indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns![index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }
}

class WordFindQues {
  String question;
  String pathImage;
  String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = [];
  List<String>? arrayBtns = [];

  WordFindQues({
    required this.question,
    required this.pathImage,
    required this.answer,
    this.arrayBtns,
  });

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;
  void setIsDone() => isDone = true;

  bool fieldCompleteCorrect() {
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue == null).isEmpty;

    if (!complete) {
      isFull = false;
      return complete;
    }

    isFull = true;

    String answeredString =
        puzzles.map((puzzle) => puzzle.currentValue).join("");

    return answeredString == answer;
  }

  WordFindQues clone() {
    return WordFindQues(
      question: question,
      pathImage: pathImage,
      answer: answer,
    );
  }
}

class WordFindChar {
  String? currentValue;
  int? currentIndex;
  String? correctValue;
  bool hintShow;

  WordFindChar({
    this.currentValue,
    this.currentIndex,
    required this.correctValue,
    this.hintShow = false,
  });

  getCurrentValue() {
    if (correctValue != null) {
      return currentValue;
    } else if (hintShow) {
      return correctValue;
    }
  }

  void clearValue() {
    currentIndex = null;
    currentValue = null;
  }
}
