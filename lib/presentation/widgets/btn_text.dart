import 'package:flutter/material.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';


class BtnText extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final Color color;
  final Color? colorDark ;
  const BtnText(
      {Key? key,
        required this.onPressed,
        required this.txt,
        required this.color,
        this.colorDark
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(StadiumBorder()
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextWidget(
          txt: txt, fontSize: 16,
          color: Colors.white,
          notFontFamily: false,
        ),
      ),
    );
  }
}
