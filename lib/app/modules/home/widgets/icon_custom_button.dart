
import 'package:flutter/material.dart';

class IconButtonCustom extends StatefulWidget {
  const IconButtonCustom({
    super.key,
  });

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom> {

  bool selected = false; 


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
           BoxShadow(
            color: !selected ?  Colors.black.withOpacity(0.15) : Colors.red.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 9,
            offset: const Offset(1, 1), // changes position of shadow
          ),         
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor:selected ? MaterialStateProperty.all(Colors.red) : MaterialStateProperty.all(Colors.white),
          shadowColor: selected ? MaterialStateProperty.all(Colors.red) : MaterialStateProperty.all(Colors.white),          
        ),
        hoverColor: Colors.black.withOpacity(0.5),
        icon: selected ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
        color: selected ? Colors.white : Colors.red ,
        onPressed: () {
          selected = !selected;
          setState(() {
            
          });
        },
      ),
    );
  }
}
