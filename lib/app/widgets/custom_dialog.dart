import 'package:flutter/material.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

class CustomDialog extends StatefulWidget {
  final String? text;
  final String textConfirm;
  final String textCancel;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Widget? layout;

  CustomDialog({
    Key? key,
    this.text,
    this.layout,
    required this.textConfirm,
    required this.textCancel,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);


  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: GestureDetector(
            onTap: () {
              logger.wtf("message");
            },
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(
                // minWidth: 330,
                Size(
                  330,
                  MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromRGBO(52, 52, 52, 1)
                    // gradient: Gradients.linearGradient4,
                    ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.text!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MainButton(
                          text: widget.textCancel,
                          onPressed: () => widget.onCancel.call(),
                          width: 150,
                        ),
                        MainButton(
                          text: widget.textConfirm,
                          onPressed: () => widget.onConfirm.call(),
                          width: 150,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
