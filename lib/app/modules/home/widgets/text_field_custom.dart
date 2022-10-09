import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.onChanged,
    
  });

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),  
      child: TextField(
        inputFormatters: [         
          FilteringTextInputFormatter.allow(RegExp('([A-Z]|[a-z])'),),          
        ],            
        onChanged:onChanged,     
        decoration: const  InputDecoration(hintText: ' Search by name',prefixIcon: Icon(Icons.search,size: 20,),),             
       ),
    );
  }
}
