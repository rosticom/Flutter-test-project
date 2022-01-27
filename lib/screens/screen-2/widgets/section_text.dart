
import 'package:flutter/material.dart';
import 'package:test_prj/constant/colors.dart';

Widget sectionText(String sectionText, bool centerText) => 
    Row(
      mainAxisAlignment: centerText 
      ? MainAxisAlignment.center 
      : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Text(
          sectionText,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: ProjectColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: -0.165
          ),
        )
      ],
    );