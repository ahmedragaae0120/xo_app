import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:provider/provider.dart';
import 'package:xo_app/ui/providers/game_provider.dart';
import 'package:xo_app/ui/reusable%20components/neon_container.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = "/GameScreen";
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    GameProvider providergame = Provider.of<GameProvider>(context);
    return Container(
      color: const Color(0xff2B0040),
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxRadius: 30.r,
            spawnMinSpeed: 10.00,
            particleCount: 30,
            spawnMaxSpeed: 50,
            minOpacity: 0.1,
            spawnOpacity: 0.2,
            image: const Image(image: AssetImage('assets/xo.png')),
          ),
        ),
        vsync: this,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 112.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeonContainerCustom(
                      winner: providergame.p1_win,
                      score: providergame.score_p1,
                      playerName: providergame.player_1Name,
                      bordercolor: const Color(0xff48D2FE),
                      containercolor: const Color.fromARGB(255, 148, 209, 230),
                      spreadcolor: const Color(0xff48D2FE)),
                  SizedBox(width: 22.w),
                  NeonContainerCustom(
                    winner: providergame.draw,
                    score: providergame.count_draw,
                    playerName: "Draw",
                    bordercolor: const Color(0xffBCDBF9),
                    containercolor: const Color.fromARGB(255, 141, 164, 187),
                    spreadcolor: const Color(0xffBCDBF9),
                  ),
                  SizedBox(width: 22.w),
                  NeonContainerCustom(
                    winner: providergame.p2_win,
                    score: providergame.score_p2,
                    playerName: providergame.player_2Name,
                    bordercolor: const Color(0xffE2BE00),
                    containercolor: const Color.fromARGB(255, 138, 117, 15),
                    spreadcolor: const Color(0xffE2BE00),
                  ),
                ],
              ),
              SizedBox(
                height: 580.h,
                width: 580.w,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => NeonContainer(
                    borderColor: providergame.p1_win || providergame.p2_win
                        ? Colors.white
                        : Colors.transparent,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(195, 0, 0, 0),
                              width: 15.w)),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            providergame
                                .playsound("assets/sounds/softclick.mp3");
                            print(providergame.counter);
                            if (providergame.game[index] == null) {
                              if (providergame.counter % 2 == 0) {
                                providergame.addgame(index, "assets/x.svg");
                                providergame.x_plays[index] = 1;
                                if (providergame
                                        .checkWinner(providergame.x_plays) &&
                                    providergame.p1_win == false) {
                                  providergame.score_p1++;
                                  providergame.p1_win = true;
                                  providergame
                                      .playsound("assets/sounds/wingame.mp3");
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      providergame.resetGame();
                                      providergame.p1_win = false;
                                    });
                                  });
                                  return;
                                }
                              } else {
                                providergame.addgame(index, "assets/o.svg");
                                providergame.o_plays[index] = 1;
                                if (providergame
                                        .checkWinner(providergame.o_plays) &&
                                    providergame.p2_win == false) {
                                  providergame.score_p2++;
                                  providergame.p2_win = true;
                                  providergame
                                      .playsound("assets/sounds/wingame.mp3");
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      providergame.resetGame();
                                      providergame.p2_win = false;
                                    });
                                  });

                                  return;
                                }
                              }
                              providergame.counter++;
                              if (providergame.counter == 9) {
                                providergame.count_draw++;
                                providergame.draw = true;
                                providergame
                                    .playsound("assets/sounds/wingame.mp3");
                                Future.delayed(const Duration(seconds: 2), () {
                                  setState(() {
                                    providergame.resetGame();
                                    providergame.draw = false;
                                  });
                                });
                              }
                            }
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(85, 68, 17, 91)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: const Color(0xff43115B),
                                        width: 3.w)))),
                        child: providergame.game[index],
                      ),
                    ),
                  ),
                  itemCount: 9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
