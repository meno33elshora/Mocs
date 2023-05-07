import 'package:flutter/material.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';


class BtnWidget extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final Color color;
  final Color? colorDark ;
  final Color? colorLight ;
  final IconData iconData;

  const BtnWidget({
    Key? key,
    required this.onPressed,
    required this.txt,
    required this.color ,
    required this.iconData,
    this.colorDark,
    this.colorLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        elevation: MaterialStateProperty.all(0.0),
      ),
      icon: Icon(
        iconData,
        color:
        Colors.white,
      ),
      label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(
            txt: txt,
            fontSize: 16,
            color:

                Colors.white,
            notFontFamily: true,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
