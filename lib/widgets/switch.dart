import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 50.0,
        height: 28.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: !value ? Colors.grey[100] : Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
          child: Container(
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(
                value ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                size: 14,
                color: value ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
