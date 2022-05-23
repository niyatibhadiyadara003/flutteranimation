import 'package:flutter/material.dart';

class SinglePlanetPage extends StatefulWidget {
  const SinglePlanetPage({Key? key}) : super(key: key);

  @override
  State<SinglePlanetPage> createState() => _SinglePlanetPageState();
}

class _SinglePlanetPageState extends State<SinglePlanetPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      bottomNavigationBar: Container(
        alignment: Alignment.centerRight,
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('planet_page');
          },
          child: const Text(
            "< Back  ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff101438),
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: const Color(0xff101438),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xff101438),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                  child: Text(
                                    "Welcome To ${args[1]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset(
                                  args[0],
                                  height: 130,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Distance to Sun",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  args[3],
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Distance to Earth",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "245.89m km",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  });
                },
                child: Stack(
                  alignment: const Alignment(0, -1.8),
                  children: [
                    Container(
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Text(
                            args[1],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                letterSpacing: 2,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Milkyway Glaxey",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 6,
                            width: 50,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/ic_distance.png',
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    args[2],
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/ic_gravity.png',
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    args[3],
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    RotationTransition(
                      turns: controller,
                      child: Image.asset(
                        args[0],
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "OVERVIEW",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 350,
                alignment: Alignment.center,
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.',
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.fade,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
