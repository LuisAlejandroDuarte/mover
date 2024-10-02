import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onchanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final int? maxlines;
  final double? radiusBorder;
  final String? initialValue;
  final TextInputType? textInputType;  

  const CustomTextField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onchanged, 
    this.validator,
    this.obscureText, 
    this.maxlines,
    this.radiusBorder, 
    this.initialValue, 
    this.textInputType = TextInputType.text    
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;     
    final border = OutlineInputBorder(    
      borderRadius: BorderRadius.circular((radiusBorder == null)? 40: radiusBorder!)
    );
    return TextFormField(         
      keyboardType: textInputType, 
      inputFormatters: (textInputType == TextInputType.number)? [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))]:[],            
      onChanged: onchanged,
      validator:validator,          
      initialValue: initialValue, 
      obscureText: (obscureText == null)? false:obscureText!,
      maxLines: (maxlines == null)? 1: maxlines ,      
      decoration:InputDecoration(     
        enabledBorder: border,      
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        
        label:label!=null ? Text(label!) :null,
        hintText: hint,
        errorText: (errorMessage == null)? errorMessage : errorMessage!,
        focusColor: colors.primary,
        
      ) ,
      
    );

  }
}