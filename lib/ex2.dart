import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Buttons'),
          backgroundColor: Colors.grey[200],
        ),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(
                label: 'Submit',
                icon: Icons.send,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Upload',
                icon: Icons.upload,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Account',
                icon: Icons.account_balance,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });
  Color get buttonColor {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ]
            : [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(width: 10),
                Icon(icon, color: Colors.white),
              ],
      ),
    );
  }
}
