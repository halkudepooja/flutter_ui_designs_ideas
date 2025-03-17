import 'package:flutter/material.dart';

class SimpleRoundIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Text buttonText;
  final Icon icon;
  final Color? iconColor;
  final Alignment iconAlignment;
  final Function? onPressed;

  const SimpleRoundIconButton({super.key, required this.backgroundColor, required this.buttonText, required this.icon, this.iconColor, required this.iconAlignment, this.onPressed});

 

  @override
  /// Returns a Container widget with a TextButton inside it.
  /// The TextButton is a rounded button with the given [backgroundColor].
  /// The button will have the given [buttonText] as its child.
  /// The button will also have the given [icon] on the left or right side depending on the [iconAlignment].
  /// The icon color can be set with [iconColor].
  /// The button will be centered horizontally and vertically.
  /// The button will have a margin of 20.0 on top and a padding of 20.0 on the left and right.
  /// The button will take up the maximum possible space in the horizontal direction.
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0))),
                  overlayColor: WidgetStateProperty.all(backgroundColor),
                  backgroundColor:
                      WidgetStateProperty.all(backgroundColor),
                ),
                child:  Row(
                  children: <Widget>[
                    iconAlignment == Alignment.centerLeft
                        ?  Transform.translate(
                            offset: Offset(-10.0, 0.0),
                            child:  Container(
                              padding: const EdgeInsets.all(5.0),
                              child: MaterialButton(
                                shape:  RoundedRectangleBorder(
                                    borderRadius:
                                         BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Icon(
                                  icon.icon,
                                  color: iconColor ?? backgroundColor,
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          )
                        : Container(),
                    iconAlignment == Alignment.centerLeft
                        ? Container()
                        : Container(),
                     Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                      child: buttonText,
                    ),
                    iconAlignment == Alignment.centerRight
                        ? Container()
                        : Container(),
                    iconAlignment == Alignment.centerRight
                        ?  Transform.translate(
                            offset: Offset(10.0, 0.0),
                            child:  Container(
                              padding: const EdgeInsets.all(5.0),
                              child: MaterialButton(
                                shape:  RoundedRectangleBorder(
                                    borderRadius:
                                         BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Icon(
                                  icon.icon,
                                  color: iconColor ?? backgroundColor,
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                onPressed: () => onPressed!(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}