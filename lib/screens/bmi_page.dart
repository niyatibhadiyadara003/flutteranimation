import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  String underweight = 'Under Weight';
  String normalweight = 'Normal Weight';
  String preobesity = 'Pre-Obesity';
  String obesityclass1 = 'Obesity Class I';
  String obesityclass2 = 'Obesity Class II';
  String obesityclass3 = 'Obesity Class III';

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xff101438),
      appBar: AppBar(
        backgroundColor: const Color(0xff101438),
        elevation: 0,
        title: const Text(
          "Your BMI result",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              (args >= 18.5)
                  ? underweight
                  : (args > 18.5 && args <= 24.9)
                      ? normalweight
                      : (args >= 25.0 && args <= 29.9)
                          ? preobesity
                          : (args >= 30.0 && args <= 34.9)
                              ? obesityclass1
                              : (args >= 35.0 && args <= 39.9)
                                  ? obesityclass2
                                  : obesityclass3,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              "$args",
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              width: 350,
              alignment: Alignment.center,
              child: Text(
                (args >= 18.5)
                    ? 'You have under body weight'
                    : (args > 18.5 && args <= 24.9)
                        ? 'You have normal body weight good job'
                        : (args >= 25.0 && args <= 29.9)
                            ? 'You have pre-obesity weight'
                            : (args >= 30.0 && args <= 34.9)
                                ? 'You have obesity weight class 1 you have to do exercise'
                                : (args >= 35.0 && args <= 39.9)
                                    ? 'You have obesity weight class 2 you have to do exercise'
                                    : 'You have obesity weight class 3 you have to do exercise',
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFF0266),
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/',
                  );
                },
                child: const Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
