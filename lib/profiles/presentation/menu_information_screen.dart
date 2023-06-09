import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class menuInformation extends StatelessWidget {
  const menuInformation({
    Key? key,
    required this.title,
    required this.onPress,
    this.endIcon=true,
    this.textColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title:Text(title,style: Theme.of(context).textTheme.bodyMedium?.apply(color:textColor)),
      trailing:endIcon? Container(
          width: 30,
          height: 30,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_right,size:18.0 ,color:Colors.black)):null,
    );
  }
}
