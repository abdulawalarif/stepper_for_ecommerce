import 'package:flutter/material.dart';
import 'package:stepper_for_ecommerce/main.dart';

class HorizontalStepper extends StatefulWidget {
  const HorizontalStepper({super.key});

  @override
  State<HorizontalStepper> createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Stepper'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getStepps(),
        currentStep: currentStep,
        onStepTapped: (step)=>  setState(() => currentStep = step),
        onStepContinue: () {
          final isLastStep = currentStep == getStepps().length - 1;
          if (isLastStep) {
            'Sending data to the server'.log();
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepCancel: () {
          currentStep == 0 ? null : setState(() => currentStep -= 1);
        },
      ),
    );
  }

  List<Step> getStepps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Account'),
          content: Container(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Container(),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: Container(),
        ),
      ];
}
