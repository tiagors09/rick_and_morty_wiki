import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String cover;
  final String title;
  final void Function()? onTap;

  const MenuOption({
    super.key,
    required this.cover,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              cover,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.black87,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
