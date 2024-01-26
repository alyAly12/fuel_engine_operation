import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomKeyBoard extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const CustomKeyBoard({super.key, required this.controller, required this.focusNode});

  @override
  State<CustomKeyBoard> createState() => _CustomKeyBoardState();
}

class _CustomKeyBoardState extends State<CustomKeyBoard> {
  late TextEditingController _controller;
  late TextSelection _selection;
  late FocusNode _focusNode;
  String temp = '';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller..addListener(_onSelectionChanged);
    _selection = _controller.selection;
    _focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    _controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  void _onSelectionChanged() {
    setState(() {
      _selection = _controller.selection;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: AppColors.customKeyboardColor,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 1.w),
        child: Column(
          children: [
            Row(
              children: [
                _buildButton('A'),
                _buildButton('B'),
                _buildButton('J'),
                _buildButton('D'),
                _buildButton('R'),
              ],
            ),
            Row(
              children: [
                _buildButton('S'),
                _buildButton('X'),
                _buildButton('T'),
                _buildButton('E'),
                _buildButton('G'),

              ],
            ),
            Row(
              children: [
                _buildButton('K'),
                _buildButton('L'),
                _buildButton('Z'),
                _buildButton('N'),
                _buildButton('H'),
              ],
            ),
            Row(
              children: [
                _buildButton('U'),
                _buildButton('V'),
                _buildButton(''),
                _buildButton(''),
                // _buildButton('', onPressed: _hideKeyboard),
                _buildButton('⌫', onPressed: _backspace),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // _hideKeyboard() => _focusNode.unfocus();
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
          onPressed: onPressed ?? () => _input(text),
          child: CustomTextWidget(title: text,color: AppColors.appBarColor,fontSize: 10.sp,fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
  void _input(String text) {
    int position = _selection.base.offset;
    var value = _controller.text;
    if (value.isNotEmpty ) {
      var suffix = value.substring(position, value.length );
      value = value.substring(0, position ) + text + suffix;
      _controller.text = value;
      _controller.selection =
          TextSelection.fromPosition(TextPosition(offset: position + 1));
    } else {
      value = _controller.text + text;
      _controller.text = value;
      _controller.selection =
          TextSelection.fromPosition(const TextPosition(offset: 1));
    }
  }
  void _backspace() {
    int position = _selection.base.offset;
    final value = _controller.text;
    if (value.isNotEmpty && position != 0) {
      var suffix = value.substring(position, value.length);
      _controller.text = value.substring(0, position - 1) + suffix;
      _controller.selection =
          TextSelection.fromPosition(TextPosition(offset: position - 1));
    }
  }
}
