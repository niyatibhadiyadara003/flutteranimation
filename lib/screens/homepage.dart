import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Color femalecolor = Colors.white;
  Color malecolor = Colors.white;
  double sliderval = 50;
  int weight = 0;
  int age = 0;
  late AnimationController controller;
  late AnimationController controller2;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
      lowerBound: -100,
      upperBound: 1,
      // value: -100,
    )..forward().then((value) {
        setState(() {});
      });
    controller2 = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
      lowerBound: -10,
      upperBound: 0,
      // value: -100,
    )..forward().then((value) {
        setState(() {});
      });
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
    controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101438),
      appBar: AppBar(
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                femalecolor = Colors.white;
                malecolor = Colors.white;
                age = 0;
                weight = 0;
                sliderval = 50;
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xff101438),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(controller.value, controller.value * 0),
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        malecolor = (malecolor == Colors.white)
                            ? const Color(0xffFF0266)
                            : Colors.white;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 70,
                            color: malecolor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "MALE",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: controller2,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(
                          controller2.value * -30, controller2.value * 0),
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        femalecolor = (femalecolor == Colors.white)
                            ? const Color(0xffFF0266)
                            : Colors.white;
                      });
                    },
                    child: Container(
                      height: 160,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 70,
                            color: femalecolor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "FEMALE",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: controller2,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset:
                      Offset(controller2.value * -30, controller2.value * 0),
                  child: child,
                );
              },
              child: Container(
                height: 200,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${sliderval.toInt()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Slider(
                        max: 200,
                        min: 50,
                        thumbColor: const Color(0xffFF0266),
                        activeColor: const Color(0xffFF0266),
                        value: sliderval,
                        onChanged: (val) {
                          setState(() {
                            sliderval = val;
                          });
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(controller.value, controller.value * 0),
                      child: child,
                    );
                  },
                  child: Container(
                    height: 160,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xff101438),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.black,
                                                ),
                                                child: const Text(
                                                  'Wrong Answer',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          );
                                        });
                                  }
                                });
                              },
                              backgroundColor: Color(0xff101438),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: controller2,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          controller2.value * -30, controller2.value * 0),
                      child: child,
                    );
                  },
                  child: Container(
                    height: 160,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xff101438),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.black,
                                              ),
                                              child: const Text(
                                                'Wrong Answer',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        );
                                      },
                                    );
                                  }
                                });
                              },
                              backgroundColor: Color(0xff101438),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
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
                  double heightm = sliderval / 100;
                  double bmi = weight / (heightm * heightm);
                  print(bmi.roundToDouble());
                  Navigator.of(context).pushReplacementNamed('bmi_page',
                      arguments: bmi.roundToDouble());
                },
                child: const Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
