import 'package:flutter/material.dart';
import 'package:imc_calculator/components/genderSelector.dart';
import 'package:imc_calculator/components/heightSelector.dart';

class ImcHomescreen extends StatefulWidget {
  const ImcHomescreen({super.key});

  @override
  State<ImcHomescreen> createState() => _ImcHomescreenState();
}

class _ImcHomescreenState extends State<ImcHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Genderselector(), HeightSelector()]);
  }
}
