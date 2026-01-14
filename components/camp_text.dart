import 'package:applicacio_tr/core/colors_app.dart';
import 'package:applicacio_tr/core/text_styles.dart';
import 'package:flutter/cupertino.dart';

class CampText extends StatefulWidget {
  final String titol;
  final String text;
  final bool ocultat;
  final TextEditingController? control;
  
  const CampText({
    super.key,
    required this.titol,
    required this.text,
    required this.ocultat,
    required this.control
    });

  @override
  State<CampText> createState() => _CampText();
}

class _CampText extends State<CampText> {
  late bool _ocultat = false;
  @override
  void initState(){
    super.initState();
    _ocultat = widget.ocultat;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titol, style: EstilText.text),
        SizedBox(height: 7),
        FractionallySizedBox(
          widthFactor: 0.75,
          child: SizedBox(
            height: 35,
            child: CupertinoTextField(
              controller: widget.control,
              placeholder: widget.text,
              obscureText: _ocultat,
              suffix: widget.ocultat
              ? CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  _ocultat
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye,
                  size: 20,
                  color: CupertinoColors.systemGrey,
                  ),
                onPressed: (){
                  setState(() {
                    _ocultat = !_ocultat;
                  });
                })
              :null,
              clearButtonMode: OverlayVisibilityMode.editing,
              decoration: BoxDecoration(
                color: ColorsApp.text,
                borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )
      ],
    );
  }
}