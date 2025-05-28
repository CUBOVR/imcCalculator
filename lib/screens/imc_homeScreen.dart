import 'package:flutter/material.dart';
import 'package:imc_calculator/components/genderSelector.dart';
import 'package:imc_calculator/components/heightSelector.dart';
import 'package:imc_calculator/components/numberSelector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcHomescreen extends StatefulWidget {
  const ImcHomescreen({super.key});

  @override
  State<ImcHomescreen> createState() => _ImcHomescreenState();
}

class _ImcHomescreenState extends State<ImcHomescreen> {
  int selectedAge = 24;
  int selectedWeight = 63;
  double selectedHeight = 140;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Genderselector(),
        HeightSelector(
          height: selectedHeight,
          onHeightChanged: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
