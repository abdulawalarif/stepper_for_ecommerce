import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

void main() {
  runApp(const MyApp());
}

extension Log on Object {
  void log() => devtools.log(toString());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Horizontal Stepper'),
        ),
        body: Stepper(
          type: StepperType.horizontal,
          steps: getStepps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getStepps().length - 1;
            if (isLastStep) {
              'Sending data to the server'.log();
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel: () {
            currentStep == 0?null: setState(() => currentStep -= 1);
          },
        ),
      ),
    );
  }

  List<Step> getStepps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text('Account'),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: Container(),
        ),
      ];
}
