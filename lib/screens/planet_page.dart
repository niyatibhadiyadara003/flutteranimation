import 'dart:math';

import 'package:flutter/material.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation rotation;
  Map<String, String> planet = {
    'assets/images/mars.png': 'Mars',
    'assets/images/neptune.png': 'Neptune',
    'assets/images/moon.png': 'Moon',
    'assets/images/earth.png': 'Earth',
    'assets/images/mercury.png': "Mercury",
    'assets/images/venus.png': 'Venus',
    'assets/images/urenus.png': 'Uranus',
    'assets/images/jupiter.png': 'Jupiter',
    'assets/images/plito.png': 'Pluto',
    'assets/images/saturn.png': 'Saturn',
  };
  Map<String, String> gravities = {
    '56.6m km': '3.78 m/s^2',
    '2.7b km': '11.5 m/s^2',
    '384.4k km': '162 m/s^2',
    '12.6m km': '12 m/s^2',
    '340.5b km': '130 m/s^2',
    '1.6m km': '20 m/s^2',
    '345m km': '344 m/s^2',
    '42m km': '121 m/s^2',
    '521m km': '48 m/s^2',
    '315m km': '464 m/s^2',
  };
  List oneplanet = [];

  List p = [];
  List pimage = [];
  List gravity = [];
  List distance = [];
  @override
  initState() {
    super.initState();
    pimage = planet.keys.map((e) => e).toList();
    p = planet.values.map((e) => e).toList();
    gravity = gravities.keys.map((e) => e).toList();
    distance = gravities.values.map((e) => e).toList();
    animationcontroller = AnimationController(
      lowerBound: 0,
      upperBound: pi * 2,
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    rotation = Tween(begin: 0, end: 360).animate(animationcontroller);
    animationcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    super.dispose();
    animationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101438),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          'Galaxy Planets',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: planet.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  oneplanet.add(pimage[i]);
                  oneplanet.add(p[i]);
                  oneplanet.add(distance[i]);
                  oneplanet.add(gravity[i]);
                  Navigator.of(context)
                      .pushNamed('single_planet_page', arguments: oneplanet);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: (pimage[i] == 'assets/images/plito.png')
                          ? const Alignment(-1.7, 0)
                          : const Alignment(-1.3, 0),
                      children: [
                        Container(
                          height: 150,
                          width: 310,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${p[i]}",
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Milkyway Galaxy",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 6,
                                    width: 40,
                                    color: Colors.blueAccent,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_distance.png',
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${gravity[i]}",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Image.asset(
                                        'assets/images/ic_gravity.png',
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${distance[i]}",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RotationTransition(
                          turns: animationcontroller,
                          child: Image.asset(
                            '${pimage[i]}',
                            height: (pimage[i] == 'assets/images/plito.png')
                                ? 110
                                : (pimage[i] == 'assets/images/saturn.png')
                                    ? 80
                                    : 100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
