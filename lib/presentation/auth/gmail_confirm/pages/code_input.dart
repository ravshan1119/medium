import 'package:flutter/material.dart';
import 'package:medium/presentation/auth/widgets/global_text_fields.dart';

class CodeInput extends StatelessWidget {
  const CodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalTextField(
          onChanged: (v){},
          hintText: "Code",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
