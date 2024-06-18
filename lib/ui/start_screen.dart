import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:provider/provider.dart';
import 'package:xo_app/ui/game_screen.dart';
import 'package:xo_app/ui/providers/game_provider.dart';
import 'package:xo_app/ui/reusable%20components/neon_container.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = "/StartScreen";
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GameProvider providergame = Provider.of<GameProvider>(context);
    return Container(
        color: const Color(0xff2B0040),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              spawnMaxRadius: 30,
              spawnMinSpeed: 10.00,
              particleCount: 30,
              spawnMaxSpeed: 50,
              minOpacity: 0.1,
              spawnOpacity: 0.2,
              image: Image(image: AssetImage('assets/xo.png')),
            ),
          ),
          vsync: this,
          child: Scaffold(
            backgroundColor: Colors.transparent, // Purple background
            body: Center(
              child: Container(
                padding: REdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Image.asset(
                          "assets/_8719a1d6-4f2f-4c90-af8e-550a36df4828.jpeg"),
                      SizedBox(height: 40.h),
                      NeonContainer(
                        lightBlurRadius: 5,
                        containerColor: Colors.white,
                        spreadColor: Colors.purple,
                        lightSpreadRadius: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: player1Controller,
                                decoration: InputDecoration(
                                  labelText: 'Player 1',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: NeonText(
                                    text: "X",
                                    textColor: Colors.black,
                                    textSize: 50.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: player2Controller,
                                decoration: InputDecoration(
                                  labelText: 'Player 2',
                                  border: const OutlineInputBorder(),
                                  prefixIcon: NeonText(
                                    text: "O",
                                    textColor: Colors.black,
                                    textSize: 50.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      InkWell(
                        onTap: () {
                          providergame.changePlayerName(
                            player1: player1Controller.text,
                            player2: player2Controller.text,
                          );
                          Navigator.of(context).pushNamed(GameScreen.routeName);
                          player1Controller.text = "";
                          player2Controller.text = "";
                        },
                        child: NeonContainer(
                          height: 60.h,
                          width: 200.w,
                          borderRadius: BorderRadius.circular(15),
                          child: const Center(
                            child: NeonText(
                              text: "Start",
                            ),
                          ),
                        ),
                      ),
                      // NeonContainer(
                      //   child: ElevatedButton(
                      //     style: ButtonStyle(
                      //         shape: MaterialStateProperty.all(
                      //             const RoundedRectangleBorder())),
                      //     onPressed: () {
                      //       providergame.changePlayerName(
                      //         player1: _player1Controller.text,
                      //         player2: _player2Controller.text,
                      //       );
                      //       Navigator.of(context)
                      //           .pushNamed(GameScreen.routeName);
                      //     },
                      //     child: const Text('Start'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
