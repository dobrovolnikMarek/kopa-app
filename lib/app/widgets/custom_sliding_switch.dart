import 'package:flutter/material.dart';

class CustomSlidingSwitch extends StatefulWidget {
  final double height;
  final ValueChanged<bool> onChanged;
  final double width;
  final bool value;
  final String textOff;
  final String textOn;
  final Duration animationDuration;
  final Color colorOn;
  final Color colorOff;
  final Color background;
  final Color buttonColor;
  final Color inactiveColor;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;

  const CustomSlidingSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.onTap,
    required this.onDoubleTap,
    required this.onSwipe,
    required this.height,
    required this.width,
    required this.textOff,
    required this.textOn,
    required this.animationDuration,
    required this.colorOn,
    required this.colorOff,
    required this.background,
    required this.buttonColor,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  _SlidingSwitch createState() => _SlidingSwitch();
}

class _SlidingSwitch extends State<CustomSlidingSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double value = 0.0;

  late bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;
    _determine();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          _action();
          widget.onDoubleTap();
        },
        onTap: () {
          _action();
          widget.onTap();
        },
        onPanEnd: (details) {
          _action();
          widget.onSwipe();
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(50)),
          child: Stack(children: <Widget>[
            Transform.translate(
                offset: Offset(((widget.width * 0.5) * value - (2 * value)), 0),
                child: Container(
                  height: widget.height,
                  width: widget.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      color: widget.buttonColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20.0,
                        ),
                      ]),
                )),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      widget.textOff,
                      style: TextStyle(
                          color: turnState
                              ? widget.inactiveColor
                              : widget.colorOff,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.textOn,
                      style: TextStyle(
                          color:
                              turnState ? widget.colorOn : widget.inactiveColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();
      if (changeState) widget.onChanged(turnState);
    });
  }
}
