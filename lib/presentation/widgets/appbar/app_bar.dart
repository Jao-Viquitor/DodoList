import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/logo.svg', height: 24),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 14),
                child: Text(
                  "John",
                  style: TextStyles.title,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
