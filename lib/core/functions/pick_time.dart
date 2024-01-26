
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void>pickTime({required TextEditingController controller, required BuildContext context,})async{
  TimeOfDay _dateTime = TimeOfDay.now();
  FocusScope.of(context).requestFocus(FocusNode());
  TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _dateTime,
      initialEntryMode: TimePickerEntryMode.dial
  );
  if(picked != null && picked != _dateTime){
    controller.text = picked.format(context).toString();
    setState(() {
      _dateTime = picked;
    });
  }else{
    _dateTime;
  }
}