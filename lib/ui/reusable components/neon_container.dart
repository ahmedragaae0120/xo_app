import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class NeonContainerCustom extends StatelessWidget {
  final bool winner;
  final int score;
  final String playerName;
  final Color bordercolor;
  final Color containercolor;
  final Color spreadcolor;
  const NeonContainerCustom(
      {super.key,
      required this.winner,
      required this.score,
      required this.playerName,
      required this.bordercolor,
      required this.containercolor,
      required this.spreadcolor});

  @override
  Widget build(BuildContext context) {
    return winner
        ? NeonContainer(
            width: 100,
            height: 100,
            borderRadius: BorderRadius.circular(10),
            borderColor: bordercolor,
            containerColor: containercolor,
            spreadColor: spreadcolor,
            lightSpreadRadius: 2,
            lightBlurRadius: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$playerName ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Text(
                      "$score",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bordercolor.withOpacity(0.20),
            ),
            width: 100,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$playerName ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "$score",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
