import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(193, 238, 238, 238),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}
