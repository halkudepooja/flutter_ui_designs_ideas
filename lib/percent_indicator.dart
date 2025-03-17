import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class PercentIndicator extends StatefulWidget {
  const PercentIndicator({super.key, required this.title});

  final String title;

  @override
  State<PercentIndicator> createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  int currentStep = 1;

  // This method is used to increment the counter of the Linear Progress Bar.

  void _incrementCounter() {
    if (currentStep <= 6) {
      setState(() {
        currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: LinearProgressBar(
                maxSteps: 6,
                progressType: LinearProgressBar.progressTypeLinear,
                minHeight: 16,
                // Use Linear progress
                currentStep: currentStep,
                progressColor: Colors.red,
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }

  // This method is used to decrement the counter of the Linear Progress Bar.
  void _decrementCounter() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }
}
