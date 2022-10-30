import 'package:confetti/confetti.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';

class BuildPuzzleContainer extends StatelessWidget {
  const BuildPuzzleContainer({Key? key, required this.containerWidth})
      : super(key: key);

  final int containerWidth;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return ValueListenableBuilder<List<int>>(
              valueListenable: homePageNotifier.myArray,
              builder: (context, value, _) {
                return buildPuzzle(context);
              });
        });
  }

  Widget buildPuzzle(BuildContext context) => Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(borderRadius: kBorder),
        child: Container(
          alignment: Alignment.center,
          width: (containerWidth * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value)),
          height: (containerWidth * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: kBorder,
            color: Theme.of(context).brightness.name == "light"
                ? HexColor("#fafafa")
                : HexColor("#303030"),
          ),
          child: Wrap(
            children: [
              for (var i = 0; i < homePageNotifier.myArray.value.length; i++)
                BuildContainerClass(value: homePageNotifier.myArray.value[i],containerWidth: containerWidth,),
            ],
          ),
        ),
      );
}

class BuildContainerClass extends StatefulWidget {
  const BuildContainerClass({Key? key, required this.value, required this.containerWidth}) : super(key: key);

  final int value;
  static int zeroIndex = homePageNotifier.myArray.value.indexOf(0);
  static int hoverIndex = 0;
  final int containerWidth;

  @override
  State<BuildContainerClass> createState() => _BuildContainerClassState();
}

class _BuildContainerClassState extends State<BuildContainerClass> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: homePageNotifier.isHovering,
        builder: (context, values, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildConfetti(),
              buildColorContainer(widget.value, context),
            ],
          );
        });
  }

  Widget buildColorContainer(int index, BuildContext context) => Padding(
        padding: kPadding / 5,
        child: MouseRegion(
          onEnter: (PointerEvent event) {
            homePageNotifier.updateHover();
            BuildContainerClass.hoverIndex = index;
          },
          onExit: (PointerEvent event) {
            homePageNotifier.updateHover();
          },
          child: GestureDetector(
            onTap: () {
              BuildContainerClass.zeroIndex =
                  homePageNotifier.myArray.value.indexOf(0);

              if (isAdjacent(index) && isNotDiagonallyOpposite(index)) {
                homePageNotifier.updateMoves();
                homePageNotifier.lastClicked = index;
                homePageNotifier.updateArray(
                    homePageNotifier.myArray.value.indexOf(index), 0);
                homePageNotifier.updateArray(
                    BuildContainerClass.zeroIndex, index);
              }
              if (listEquals(homePageNotifier.myArray.value,
                      homePageNotifier.newArray) &&
                  homePageNotifier.canAnimate == true) {
                _controller.play();
                homePageNotifier.canAnimate = false;
              }
            },
            child: DelayedDisplay(
              delay: Duration(
                  milliseconds:
                      homePageNotifier.myArray.value.indexOf(index) * 50),
              child: Container(
                width: MediaQuery.of(context).size.width<=420?(((widget.containerWidth * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value))/(homePageNotifier.n.value) )-(homePageNotifier.n.value*4)):widget.containerWidth.toDouble(),
                height: MediaQuery.of(context).size.width<=420?(((widget.containerWidth * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value))/(homePageNotifier.n.value))-(homePageNotifier.n.value*4)):widget.containerWidth.toDouble(),
                child: Center(
                    child: index != 0
                        ? Text(
                            index.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          )
                        : const SizedBox()),
                decoration: BoxDecoration(
                    borderRadius: kBorder,
                    color: index == 0
                        ? Colors.transparent
                        : homePageNotifier.lastClicked == index
                            ? secondaryColor
                            : homePageNotifier.isHovering.value &&
                                    BuildContainerClass.hoverIndex == index
                                ? hoverColor
                                : primaryColor),
              ),
            ),
          ),
        ),
      );

  isAdjacent(int index) {
    return (homePageNotifier.myArray.value.indexOf(index) ==
            BuildContainerClass.zeroIndex - 1 ||
        homePageNotifier.myArray.value.indexOf(index) ==
            BuildContainerClass.zeroIndex + 1 ||
        homePageNotifier.myArray.value.indexOf(index) ==
            BuildContainerClass.zeroIndex - homePageNotifier.n.value ||
        homePageNotifier.myArray.value.indexOf(index) ==
            BuildContainerClass.zeroIndex + homePageNotifier.n.value);
  }

  isNotDiagonallyOpposite(int index) {
    return homePageNotifier.n.value != 2
        ? ((BuildContainerClass.zeroIndex % (homePageNotifier.n.value) != 0 ||
                (homePageNotifier.myArray.value.indexOf(index) + 1) %
                        (homePageNotifier.n.value) !=
                    0) &&
            ((homePageNotifier.myArray.value.indexOf(index) %
                        (homePageNotifier.n.value) !=
                    0 ||
                (BuildContainerClass.zeroIndex + 1) %
                        (homePageNotifier.n.value) !=
                    0)))
        : ((BuildContainerClass.zeroIndex != 2 ||
                homePageNotifier.myArray.value.indexOf(index) + 1 != 2) &&
            (BuildContainerClass.zeroIndex != 1 ||
                homePageNotifier.myArray.value.indexOf(index) != 2));
  }

  Widget buildConfetti() => ConfettiWidget(
        blastDirectionality: BlastDirectionality.explosive,
        confettiController: _controller,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 100,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [
          Colors.green,
          Colors.red,
          Colors.yellow,
          Colors.blue,
        ],
      );
}
