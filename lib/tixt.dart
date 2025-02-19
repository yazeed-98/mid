import 'package:flutter/material.dart';

class Tixt extends StatefulWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color? borderColor;
  final double? border;
  final Color? iconColor;
  final Color? sufColor;
  final Color? lablColor;
  final double? border1;
  final Color? colorr;
  final TextEditingController controller;
  final void Function(String?)? onSaved;

  Tixt({
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    this.border,
    this.lablColor,
    this.iconColor,
    this.sufColor,
    this.border1,
    this.colorr,
    required this.controller,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  State<Tixt> createState() => _TixtState();
}

class _TixtState extends State<Tixt> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: (input) {
        if (input == null || input.length < 3) {
          return 'Please enter at least 3 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(widget.prefixIcon, color: widget.iconColor),
        suffixIcon: widget.suffixIcon != null
            ? Icon(widget.suffixIcon, color: widget.sufColor)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border1 ?? 10),
          borderSide: BorderSide(color: widget.enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border ?? 10),
          borderSide: BorderSide(color: widget.focusedBorderColor),
        ),
        filled: true,
        fillColor: widget.colorr,
      ),
    );
  }
}
