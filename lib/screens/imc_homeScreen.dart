import 'package:flutter/material.dart';
import 'package:imc_calculator/components/genderSelector.dart';
import 'package:imc_calculator/components/heightSelector.dart';
import 'package:imc_calculator/components/numberSelector.dart';

class ImcHomescreen extends StatefulWidget {
  const ImcHomescreen({super.key});

  @override
  State<ImcHomescreen> createState() => _ImcHomescreenState();
}

class _ImcHomescreenState extends State<ImcHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Genderselector(),
        HeightSelector(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: NumberSelector(title: "PESO")),
              SizedBox(width: 16),
              Expanded(child: NumberSelector(title: "PESO")),
            ],
          ),
        ),
      ],
    );
  }
}
