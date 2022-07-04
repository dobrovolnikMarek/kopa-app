import 'package:flutter/material.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

class BottomSheetDefaultLayout extends StatelessWidget {
  final VoidCallback? onAccept, onCancel;
  final String title;
  final String? subtitle, acceptText, cancelText;
  final List<MainButton>? actions;
  const BottomSheetDefaultLayout({
    Key? key,
    required this.title,
    this.acceptText,
    this.cancelText,
    this.onAccept,
    this.onCancel,
    this.subtitle,
    this.actions,
  })  : assert(actions == null ? acceptText != null : true,
  "acceptText text shouldn't be null if not using actions"),
        assert(actions == null ? cancelText != null : true,
        "cancelText text shouldn't be null if not using actions"),
        assert(actions == null ? onAccept != null : true,
        "onAccept text shouldn't be null if not using actions"),
        assert(actions == null ? onCancel != null : true,
        "onCancel text shouldn't be null if not using actions"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 10.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Wrap(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 5.0,
                right: 5.0,
                bottom: 5.0,
              ),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color.fromRGBO(163, 163, 163, 1),
                ),
              ),
            ),
          if (actions == null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: MainButton(
                onPressed: onAccept,
                text: acceptText!,
              ),
            ),
/*            GFButton.text(
              isPrimary: false,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              onPressed: onCancel,
              text: cancelText,
            ),*/
          ] else
            ...actions!
                .map(
                  (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: e,
              ),
            )
                .toList()
        ],
      ),
    );
  }
}
