import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/models/question.dart';
import 'package:flutter_application_1/views/results_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final PageController _pageController = PageController();
  final List<Question> _questions = [
    Question(
      text: 'What is a key feature of mobile computing systems?',
      options: [
        'They are only stationary.',
        'They cannot connect to wireless networks.',
        'They allow usage while moving.',
        'They require a constant power source.'
      ],
      correctAnswer: 2,
    ),
    Question(
      text:
          'Which of the following is an example of a mobile computing system?',
      options: ['Desktop computer', 'Laptop', 'Television', 'Server rack'],
      correctAnswer: 1,
    ),
    Question(
      text: 'What is an advantage of mobile computing systems?',
      options: [
        'Limited network connectivity',
        'High portability',
        'Large size',
        'Fixed power source'
      ],
      correctAnswer: 1,
    ),
    Question(
      text: 'What does Wi-Fi stand for?',
      options: [
        'Wireless Fidelity',
        'Wide Frequency',
        'Web Interface',
        'Wireless Information'
      ],
      correctAnswer: 0,
    ),
    Question(
      text: 'Which of these is a feature of a mobile operating system?',
      options: [
        'Multitasking',
        'Touch input',
        'App management',
        'All of the above'
      ],
      correctAnswer: 3,
    ),
    Question(
      text:
          'Which type of mobile network provides the fastest internet speeds?',
      options: ['4G LTE', '5G', '3G', 'Wi-Fi'],
      correctAnswer: 1,
    ),
    Question(
      text: 'What is the most common mobile OS?',
      options: ['iOS', 'Android', 'Windows Phone', 'Blackberry'],
      correctAnswer: 1,
    ),
    Question(
      text: 'Which of these is not a mobile device?',
      options: ['Smartphone', 'Tablet', 'Laptop', 'Smartwatch'],
      correctAnswer: 2,
    ),
    Question(
      text: 'What is the main advantage of cloud storage?',
      options: [
        'Free storage',
        'Limited access',
        'Remote access from any device',
        'Requires physical devices'
      ],
      correctAnswer: 2,
    ),
    Question(
      text: 'Which feature is not supported by mobile computing systems?',
      options: [
        'Wireless communication',
        'Portable use',
        'Only works at fixed locations',
        'Touch-based interfaces'
      ],
      correctAnswer: 2,
    ),
  ];

  int _currentIndex = 0;
  int _timeLeft = 30; // Time limit per question
  final List<int?> _selectedAnswers = List.filled(10, null);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer
        ?.cancel(); // Cancel any existing timer to prevent multiple timers running simultaneously.
    _timeLeft = 30; // Reset the timer to 30 seconds.
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startTimer(); // Start a new timer for the next question.
    } else {
      if (_currentIndex == _questions.length - 1) {
        _showResults();
      }
    }
  }

  void _navigateToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startTimer(); // Start a new timer for the previous question.
    }
  }

  void _showResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsView(
          questions: _questions,
          answers: _selectedAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _currentIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _navigateToPrevious,
              )
            : null, // Hide "Previous" for the first question
        title: Text(
          '${_currentIndex + 1}/${_questions.length}',
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return buildQuestion(_questions[index], index);
        },
      ),
    );
  }

  Widget buildQuestion(Question question, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 10.0,
            percent: _timeLeft / 30,
            center: Text(
              '$_timeLeft',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            progressColor: ColorManager.primaryColor,
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 30),
          Text(
            question.text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...question.options.asMap().entries.map((entry) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAnswers[index] = entry.key;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: _selectedAnswers[index] == entry.key
                        ? Colors.green.shade100
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: _selectedAnswers[index] == entry.key
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedAnswers[index] == entry.key
                                ? Colors.black
                                : Colors.grey[800],
                          ),
                        ),
                      ),
                      if (_selectedAnswers[index] == entry.key)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: _navigateToNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                minimumSize:
                    Size(double.infinity, 50), // Button takes full width
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  _currentIndex == _questions.length - 1 ? 'Finish' : 'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the screen is disposed.
    super.dispose();
  }
}
