import 'package:flutter/material.dart';

class SimpleRoundButton extends StatelessWidget {
  final Color? backgroundColor;
  final Text? buttonText;
  final Function? onPressed;
  const SimpleRoundButton({
    super.key,
    this.backgroundColor,
    this.buttonText,
    this.onPressed,
  });

  @override
  /// Builds a TextButton with rounded corners and a specified background color.

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                overlayColor: WidgetStateProperty.all(backgroundColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: buttonText,
                  ),
                ],
              ),
              onPressed: () => onPressed!(),
            ),
          ),
        ],
      ),
    );
  }
}
