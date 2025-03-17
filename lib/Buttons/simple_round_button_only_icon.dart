import 'package:flutter/material.dart';

class SimpleRoundOnlyIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Icon? icon;
  final Color? iconColor;
  final Alignment iconAlignment;
  final Function? onPressed;

  const SimpleRoundOnlyIconButton({super.key, required this.backgroundColor, this.icon, this.iconColor, required this.iconAlignment, this.onPressed});


  MainAxisAlignment getMainAxisAlignment() {
    if (iconAlignment == Alignment.center) {
      return MainAxisAlignment.center;
    } else if (iconAlignment == Alignment.centerLeft) {
      return MainAxisAlignment.start;
    } else if (iconAlignment == Alignment.centerRight) {
      return MainAxisAlignment.end;
    }
    return MainAxisAlignment.center;
  }

  @override
  /// Builds a TextButton with rounded corners and a specified background color.
  
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
            children: <Widget>[
               Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(30.0))),
                    overlayColor:
                        WidgetStateProperty.all(backgroundColor),
                    backgroundColor:
                        WidgetStateProperty.all(backgroundColor),
                  ),
                  child:  Row(
                    mainAxisAlignment: getMainAxisAlignment(),
                    children: <Widget>[
                      iconAlignment == Alignment.center
                          ?  Transform.translate(
                              offset: Offset(0.0, 0.0),
                              child:  Container(
                                padding: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ),
                                    overlayColor: WidgetStateProperty.all(
                                        backgroundColor),
                                    backgroundColor: WidgetStateProperty.all(
                                        backgroundColor),
                                  ),
                                  child: Icon(
                                    icon!.icon,
                                    color: iconColor ?? Colors.white,
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            )
                          : Container(),
                      iconAlignment == Alignment.centerLeft
                          ?  Transform.translate(
                              offset: Offset(-10.0, 0.0),
                              child:  Container(
                                padding: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ),
                                    overlayColor:
                                        WidgetStateProperty.all(Colors.white),
                                    backgroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                  ),
                                  child: Icon(
                                    icon!.icon,
                                    color: iconColor ?? Colors.white,
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            )
                          : Container(),
                      iconAlignment == Alignment.centerRight ||
                              iconAlignment == Alignment.centerLeft
                          ? Expanded(
                              child: Container(),
                            )
                          : Container(),
                      iconAlignment == Alignment.centerRight
                          ?  Transform.translate(
                              offset: Offset(10.0, 0.0),
                              child:  Container(
                                padding: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: MaterialButton(
                                  shape:  RoundedRectangleBorder(
                                      borderRadius:
                                           BorderRadius.circular(28.0)),
                                  splashColor: Colors.white,
                                  color: Colors.white,
                                  child: Icon(
                                    icon!.icon,
                                    color: iconColor,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}