import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultscreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultscreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tu resultado es", style: TextStyles.principalText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getStatusByImc(imcResult),
                      style: TextStyle(
                        fontSize: 32,
                        color: getColorByImc(imcResult),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      getDescriptionsByImc(imcResult),
                      style: TextStyles.bodyText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyles.infinityStyle,
              child: Text("Finalizar", style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.backgroundComponent,
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // IMC Bajo
      < 24.9 => Colors.green,
      < 29.99 => Colors.orange, // sobrepeso
      _ => Colors.red, //Obesidad
    };
  }

  String getStatusByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "IMC Bajo", // IMC Bajo
      < 24.9 => "IMC Normal",
      < 29.99 => "Sobrepeso", // sobrepeso
      _ => "Obesidad", //Obesidad
    };
  }

  String getDescriptionsByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 =>
        "Tu peso está por debajo de lo recomendado. \nNecesitas Comer y hacer ejercicio.", // IMC Bajo
      < 24.9 =>
        "Tu peso está en el rango recomendado. \nNecesitas Comer y hacer ejercicio.",
      < 29.99 =>
        "Tu peso está por arriba de lo recomendado. \nNecesitas Comer y hacer ejercicio.", // sobrepeso
      _ =>
        "Tu peso está muy arriba de lo recomendado. \nNecesitas Comer y hacer ejercicio. \nConsulta a tu médico", //Obesidad
    };
  }
}
